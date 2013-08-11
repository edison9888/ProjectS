//
//  SelectionViewController.m
//  ProjectS
//
//  Created by zhaozilong on 13-7-4.
//
//

#import "SelectionViewController.h"
#include <sqlite3.h>
#import "QuesTextCell.h"
#import "AnswerTextCell.h"

@interface SelectionViewController () {
    sqlite3 *_database;
}
@property (nonatomic, retain)NSMutableArray *titleNumArray;
@property (nonatomic, retain)NSMutableArray *SICArray;
@property int currIndex;
@property int lastIndex;

@end

@implementation SelectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil titleNumArray:(NSMutableArray *)titleNumArray currIndex:(int)currIndex
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.titleNumArray = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], nil];
        
//        self.titleNumArray = titleNumArray;
        
        self.SICArray = [[NSMutableArray alloc] init];
        [self setSICs];
        self.currIndex = currIndex;
        self.lastIndex = [self.titleNumArray count] - 1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self.SICArray release];
    [_mainTableView release];
    [_prevBtn release];
    [_nextBtn release];
    [_favBtn release];
    [_hateBtn release];
    [_likeBtn release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setMainTableView:nil];
    [self setPrevBtn:nil];
    [self setNextBtn:nil];
    [self setFavBtn:nil];
    [self setHateBtn:nil];
    [self setLikeBtn:nil];
    [super viewDidUnload];
}

- (SelectionInfoClass *)getSICByIndex:(int)index {
    SelectionInfoClass *SIC = [self.SICArray objectAtIndex:index];
    return SIC;
}

- (void)setSICs {
    NSString *sql = @"SELECT StyleName, PackName, TitleName, QuesText, QuesImage, AnswerText, Answer, Handle, Favorite, TitleNum FROM Selection WHERE ";
    int count = [self.titleNumArray count];
    for (int i = 0; i < count; i++) {
        int titleNum = [[self.titleNumArray objectAtIndex:i] intValue];
        NSString *partSql = @"";
        if (i != count - 1) {
            partSql = [partSql stringByAppendingFormat:@"TitleNum = %d OR ", titleNum];
        } else {
            partSql = [partSql stringByAppendingFormat:@"TitleNum = %d;", titleNum];
        }
        sql = [sql stringByAppendingFormat:@"%@", partSql];
    }
    
    NSString *path = [ZZAcquirePath getSelectionDBFromDocuments];
    [self openDatabaseIn:path];
    NSLog(@"%@", sql);
    /*******PackName*************/
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(_database, [sql UTF8String], -1, &stmt, nil) != SQLITE_OK) {
        sqlite3_close(_database);
        NSAssert(NO, @"查询信息失败");
    }
    char *cStyleName = NULL;
    char *cPackName = NULL;
    char *cTitleName = NULL;
    char *cQuesText = NULL;
    char *cQuesImg = NULL;
    char *cAnswerText = NULL;
    char *cAnswer = NULL;
    NSString *styleName = nil;
    NSString *packName = nil;
    NSString *titleName = nil;
    NSString *quesText = nil;
    NSString *quesImg = nil;
    NSString *answerText = nil;
    NSString *answer = nil;
    int handle = 0;
    BOOL isFavorite = NO;
    int titleNum = 0;
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        cStyleName = (char *)sqlite3_column_text(stmt, 0);
        if (cStyleName != NULL) {
            styleName = [NSString stringWithUTF8String:cStyleName];
        }
        
        cPackName = (char *)sqlite3_column_text(stmt, 1);
        if (cPackName != NULL) {
            packName = [NSString stringWithUTF8String:cPackName];
        }
        
        cTitleName = (char *)sqlite3_column_text(stmt, 2);
        if (cTitleName != NULL) {
            titleName = [NSString stringWithUTF8String:cTitleName];
        }
        
        cQuesText = (char *)sqlite3_column_text(stmt, 3);
        if (cQuesText != NULL) {
            quesText = [NSString stringWithUTF8String:cQuesText];
        }
        
        cQuesImg = (char *)sqlite3_column_text(stmt, 4);
        if (cQuesImg != NULL) {
            quesImg = [NSString stringWithUTF8String:cQuesImg];
        }
        
        cAnswerText = (char *)sqlite3_column_text(stmt, 5);
        if (cAnswerText != NULL) {
            answerText = [NSString stringWithUTF8String:cAnswerText];
        }
        
        cAnswer = (char *)sqlite3_column_text(stmt, 6);
        if (cAnswer != NULL) {
            answer = [NSString stringWithUTF8String:cAnswer];
        }
        
        handle = sqlite3_column_int(stmt, 7);
        
        int favNum = sqlite3_column_int(stmt, 8);
        isFavorite = (favNum == 0 ? NO : YES);
        
        titleNum = sqlite3_column_int(stmt, 9);
        
        
        SelectionInfoClass *SIC = [SelectionInfoClass selectionWithTestType:0 titleNum:titleNum packName:packName styleName:styleName titleName:titleName quesText:quesText quesImgName:quesImg answerText:answerText answer:answer handle:handle];
        
        [self.SICArray addObject:SIC];
        
    }
    sqlite3_finalize(stmt);
    
    [self closeDatabase];
    
    
}

- (void)openDatabaseIn:(NSString *)dbPath {
    if (sqlite3_open([dbPath UTF8String], &_database) != SQLITE_OK) {
        //        sqlite3_close(database);
        
        NSAssert(NO, @"Open database failed");
    }
}

- (void)closeDatabase {
    if (sqlite3_close(_database) != SQLITE_OK) {
        NSAssert(NO, @"Close database failed");
    }
}

- (IBAction)prevBtnPressed:(id)sender {
    self.currIndex--;
    if (self.currIndex == 0) {
        
        [self.prevBtn setEnabled:NO];
    } else {
        
    }
    [self.nextBtn setEnabled:YES];
    [self.mainTableView reloadData];
}

- (IBAction)nextBtnPressed:(id)sender {
    self.currIndex++;
    if (self.currIndex == self.lastIndex - 1) {
//        [self.prevBtn setEnabled:YES];
        [self.nextBtn setTitle:@"交卷" forState:UIControlStateNormal];
    } else if (self.currIndex == self.lastIndex) {
        
         [self.nextBtn setEnabled:NO];
    } else {
       
    }
    [self.prevBtn setEnabled:YES];
    [self.mainTableView reloadData];
}

- (void)changeFromOneSIC:(SelectionInfoClass *)oneSIC toTwoSIC:(SelectionInfoClass *)twoSIC {
    
}

- (IBAction)favBtnPressed:(id)sender {
}

- (IBAction)hateBtnPressed:(id)sender {
}

- (IBAction)likeBtnPressed:(id)sender {
}

#pragma mark - Table view delegate
/*
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIImageView *imgView = nil;
    if (tableView.tag == TAG_TEXT_TABLE && _textShowStyle != TextShowStyleAll) {
        
        static NSString *TextSectionIdentifier = @"TextSectionFooter";
        float version = [[[UIDevice currentDevice] systemVersion] floatValue];
        
        //        UIImageView *imgView = nil;
        if (version >= 6.0)
        {
            // iPhone 3.0 code here
            imgView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:TextSectionIdentifier];
            if (!imgView) {
                imgView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"grayLine.png"]] autorelease];
            }
        } else {
            imgView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"grayLine.png"]] autorelease];
        }
        
    }
    
    return imgView;
    
}
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //问题部分
    if (section == 0) {
        return nil;
    } else {
        //选项部分
        return nil;
    }
    /*
    SectionView *TQEView = nil;
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    if (tableView.tag == TAG_TEXT_TABLE) {
        static NSString *TextSectionIdentifier = @"TextSectionHeader";
        
        if (version >= 6.0) {
            TQEView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:TextSectionIdentifier];
            if (!TQEView) {
                TQEView = [[[SectionView alloc] initWithSectionNameTag:SectionNameText] autorelease];
            }
        } else {
            TQEView = [[[SectionView alloc] initWithSectionNameTag:SectionNameText] autorelease];
        }
        
        
    } else {
        static NSString *QuestionSectionIdentifier = @"QuestionSectionHeader";
        if (version >= 6.0) {
            TQEView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:QuestionSectionIdentifier];
            if (!TQEView) {
                TQEView = [[[SectionView alloc] initWithSectionNameTag:SectionNameQuestion] autorelease];
            }
        } else {
            TQEView = [[[SectionView alloc] initWithSectionNameTag:SectionNameQuestion] autorelease];
        }
        
    }
    
    
    return TQEView;
     */
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 1;
    }
}

- (float)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 13;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int row = indexPath.row;
    int section = indexPath.section;
    
    SelectionInfoClass *SIC = [self.SICArray objectAtIndex:self.currIndex];
    
    CGFloat height = 0.0f;
    if (section == 0) {
//        height = [ZZPublicClass getTVHeightByStr:SIC.quesText];
        height = [ZZPublicClass getTVHeightByStr:SIC.quesText constraintWidth:320.0f isBold:NO];
    } else {
        int count = [SIC.answerTextArray count];
        for (int i = 0; i < count; i++) {
            NSString *answer = [SIC.answerTextArray objectAtIndex:i];
            height += [ZZPublicClass getTVHeightByStr:answer constraintWidth:320.0f isBold:NO];
        }
    }
    
    return height;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int num = [indexPath row];
    UIColor *color = nil;
    if (num % 2 == 0) {
        color = [UIColor colorWithRed:(CGFloat)232 / 255 green:(CGFloat)238 / 255 blue:(CGFloat)234 / 255 alpha:1.0];
    } else {
        color = [UIColor colorWithRed:(CGFloat)241 / 255 green:(CGFloat)250 / 255 blue:(CGFloat)245 / 255 alpha:1.0];
    }
    [cell setBackgroundColor:color];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section = [indexPath section];
//    int row = [indexPath row];
    
    SelectionInfoClass *SIC = [self.SICArray objectAtIndex:self.currIndex];
    
    if (section == 0) {
        static NSString *QuesCellIdentifier = @"QuesTextCell";
        QuesTextCell *cell = [tableView dequeueReusableCellWithIdentifier:QuesCellIdentifier];
        
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"QACell" owner:nil options:nil] objectAtIndex:0];
            
        }
        
        [cell setQuesText:SIC.quesText isBold:YES];
        
        return cell;

    } else {
        int numOfAnswer = SIC.answerArray.count;
        NSString *TextCellIdentifier = [NSString stringWithFormat:@"AnswerTextCell%d", numOfAnswer];
        AnswerTextCell *cell = [tableView dequeueReusableCellWithIdentifier:TextCellIdentifier];
        
        
        
        if (!cell) {
//            cell = [[[NSBundle mainBundle] loadNibNamed:@"QACell" owner:nil options:nil] objectAtIndex:0];
            cell = [[[AnswerTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TextCellIdentifier] autorelease];
            [cell addBtnWithSIC:SIC mode:ModeTagTest];
        }
        [cell setCellLayoutWithSIC:SIC mode:ModeTagTest];
        
        
        return cell;

    }
    

}


@end
