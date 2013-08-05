//
//  AnswerTextCell.m
//  ProjectS
//
//  Created by zhaozilong on 13-7-6.
//
//

#import "AnswerTextCell.h"

#define BUTTON_TAG_PREFIX 100

#define CONSTRAINT_WIDTH 320.0f

@interface AnswerTextCell()
@property ModeTag modeTag;

@end

@implementation AnswerTextCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)addBtnWithSIC:(SelectionInfoClass *)SIC mode:(ModeTag)modeTag {
    
//    self.modeTag = modeTag;
    
    int count = [SIC.answerTextArray count];
//    CGFloat constrainWidth = 320.0f;
    
    for (int i = 0; i < count; i++) {
//        NSString *answerText = [SIC.answerTextArray objectAtIndex:i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.tag = BUTTON_TAG_PREFIX + count + 1;
//        [button setTitle:answerText forState:UIControlStateNormal];
        [button addTarget:self action:@selector(answerBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

- (void)setCellLayoutWithSIC:(SelectionInfoClass *)SIC mode:(ModeTag)modeTag {
    self.modeTag = modeTag;
    
    int count = [SIC.answerTextArray count];
    
    CGFloat lastHeight = 0;
    for (int i = 0; i < count; i++) {
        NSString *answerText = [SIC.answerTextArray objectAtIndex:i];
        CGFloat height = [ZZPublicClass getTVHeightByStr:answerText constraintWidth:CONSTRAINT_WIDTH isBold:NO];
        UIButton *button = (UIButton *)[self viewWithTag:BUTTON_TAG_PREFIX + count + 1];
        [button setFrame:CGRectMake(0, lastHeight, CONSTRAINT_WIDTH, height)];
        [button setTitle:answerText forState:UIControlStateNormal];
        [button.titleLabel setNumberOfLines:0];
//        [button addTarget:self action:@selector(answerBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        lastHeight += height;
        NSLog(@"******%f:%@", lastHeight, answerText);
    }
    
}

- (void)answerBtnPressed:(UIButton *)sender {
    if (self.modeTag == ModeTagTest) {
        
    } else if (self.modeTag == ModeTagExcise) {
        
    } else {
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
