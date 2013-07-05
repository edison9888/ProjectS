//
//  QuesTextCell.h
//  ProjectS
//
//  Created by zhaozilong on 13-7-6.
//
//

#import <UIKit/UIKit.h>

@interface QuesTextCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UITextView *QuesTextView;

- (void)setQuesText:(NSString *)quesText isBold:(BOOL)isBold;

@end
