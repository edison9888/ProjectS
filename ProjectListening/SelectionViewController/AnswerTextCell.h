//
//  AnswerTextCell.h
//  ProjectS
//
//  Created by zhaozilong on 13-7-6.
//
//

#import <UIKit/UIKit.h>
#import "SelectionInfoClass.h"

typedef enum {
    ModeTagTest,
	ModeTagExcise,
    ModeTagMax,
} ModeTag;

@interface AnswerTextCell : UITableViewCell

- (void)addBtnWithSIC:(SelectionInfoClass *)SIC mode:(ModeTag)modeTag;
- (void)setCellLayoutWithSIC:(SelectionInfoClass *)SIC mode:(ModeTag)modeTag;
@end
