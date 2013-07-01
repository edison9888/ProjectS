//
//  ZZPublicClass.h
//  ProjectListening
//
//  Created by zhaozilong on 13-4-20.
//
//

#import <Foundation/Foundation.h>
//#import "StudyViewController.h"

#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f
//#define CELL_CONTENT_MARGIN 0.0f

#define CELL_ANSBTN_WIDTH 70
#define CELL_ANSBTN_HEIGHT 30

#define IPHONE_QUES_WIDTH_LIMIT 273.0
#define IPHONE_TEXT_WIDTH_LIMIT 310.0



@interface ZZPublicClass : NSObject

+ (void)setBackButtonOnTargetNav:(id)controller action:(SEL)action;

+ (void)setRightButtonOnTargetNav:(id)controller action:(SEL)action title:(NSString *)title;

+ (void)copyFromBundleToDocsWithFileName:(NSString *)fileName isPlist:(BOOL)isPlist;

+ (void)createUserAudioDirectory;
+ (CGFloat)getTVHeightByStr:(NSString *)text constraintWidth:(CGFloat)width isBold:(BOOL)isBold;

+ (void)rateThisApp;

+ (void)pushToPurchasePage:(UIViewController *)parentVC;

@end
