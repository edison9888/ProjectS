//
//  QuesTextCell.m
//  ProjectS
//
//  Created by zhaozilong on 13-7-6.
//
//

#import "QuesTextCell.h"
#import "UserSetting.h"

@implementation QuesTextCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setQuesText:(NSString *)quesText isBold:(BOOL)isBold {
    CGFloat height = [ZZPublicClass getTVHeightByStr:quesText constraintWidth:self.QuesTextView.frame.size.width isBold:isBold];
    CGRect frame = self.QuesTextView.frame;
    frame.size.height = height;
    [self.QuesTextView setFrame:frame];
    
    [self.QuesTextView setText:quesText];
    int fontSize = [UserSetting textFontSizeReal];
    [self.QuesTextView setFont:[UIFont fontWithName:FONT_NAME_BOLD size:fontSize]];
}

- (void)dealloc {
    [_QuesTextView release];
    [super dealloc];
}
@end
