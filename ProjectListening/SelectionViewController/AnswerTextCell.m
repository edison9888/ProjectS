//
//  AnswerTextCell.m
//  ProjectS
//
//  Created by zhaozilong on 13-7-6.
//
//

#import "AnswerTextCell.h"
#import "SelectionInfoClass.h"

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

- (void)setCellWithSIC:(SelectionInfoClass *)SIC mode:(ModeTag)modeTag {
    
    self.modeTag = modeTag;
    
    int count = [SIC.answerTextArray count];
    CGFloat constrainWidth = 320.0f;
    
    for (int i = 0; i < count; i++) {
        NSString *answerText = [SIC.answerTextArray objectAtIndex:i];
        CGFloat height = [ZZPublicClass getTVHeightByStr:answerText constraintWidth:constrainWidth isBold:NO];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.tag = count + 1;
        [button setFrame:CGRectMake(0, 0, constrainWidth, height)];
        [button setTitle:answerText forState:UIControlStateNormal];
        [button addTarget:self action:@selector(answerTextArray:) forControlEvents:UIControlEventTouchUpInside];
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
