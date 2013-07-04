//
//  SelectionViewController.h
//  ProjectS
//
//  Created by zhaozilong on 13-7-4.
//
//

#import <UIKit/UIKit.h>

@interface SelectionViewController : UIViewController <UITableViewDataSource, UITableViewDataSource>
@property (retain, nonatomic) IBOutlet UITableView *mainTableView;
@property (retain, nonatomic) IBOutlet UIButton *prevBtn;
@property (retain, nonatomic) IBOutlet UIButton *nextBtn;
@property (retain, nonatomic) IBOutlet UIButton *favBtn;
@property (retain, nonatomic) IBOutlet UIButton *hateBtn;
@property (retain, nonatomic) IBOutlet UIButton *likeBtn;
- (IBAction)prevBtnPressed:(id)sender;
- (IBAction)nextBtnPressed:(id)sender;
- (IBAction)favBtnPressed:(id)sender;
- (IBAction)hateBtnPressed:(id)sender;
- (IBAction)likeBtnPressed:(id)sender;

@end
