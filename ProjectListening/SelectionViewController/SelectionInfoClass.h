//
//  SelectionInfoClass.h
//  ProjectS
//
//  Created by zhaozilong on 13-7-4.
//
//

#import <Foundation/Foundation.h>

@interface SelectionInfoClass : NSObject

@property int testType;
@property int titleNum;
@property int quesIndex;
@property (nonatomic, retain)NSString *packName;
@property (nonatomic, retain)NSString *styleName;
@property (nonatomic, retain)NSString *titleName;
@property (nonatomic, retain)NSString *quesText;
@property (nonatomic, retain)NSString *quesImgName;
@property (nonatomic, retain)NSMutableArray *AICArray;
@property int handle;

@property (nonatomic, retain)NSArray *answerTextArray;
@property (nonatomic, retain)NSArray *answerArray;
@property (nonatomic, retain)NSMutableArray *selectedArray;
//@property int quesIndex;


+ (SelectionInfoClass *)selectionWithTestType:(int)testType titleNum:(int)titleNum packName:(NSString *)packName styleName:(NSString *)styleName titleName:(NSString *)titleName quesText:(NSString *)quesText quesImgName:(NSString *)quesImgName answerText:(NSString *)answerText answer:(NSString *)answer handle:(int)handle;





@end
