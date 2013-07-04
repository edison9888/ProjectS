//
//  SelectionViewController.m
//  ProjectS
//
//  Created by zhaozilong on 13-7-4.
//
//

#import "SelectionViewController.h"

@interface SelectionViewController ()

@end

@implementation SelectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
- (IBAction)prevBtnPressed:(id)sender {
}

- (IBAction)nextBtnPressed:(id)sender {
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
    
}

- (float)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 13;
}

- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 13;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int row = indexPath.row;
    
    return 100;
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
    int row = [indexPath row];
    
    static NSString *TextCellIdentifier = @"TextCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TextCellIdentifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:TextCellIdentifier owner:self options:nil] objectAtIndex:0];
        
    }
    
    
    return cell;

}


@end
