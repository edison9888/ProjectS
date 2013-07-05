//
//  SelectionInfoClass.m
//  ProjectS
//
//  Created by zhaozilong on 13-7-4.
//
//

#import "SelectionInfoClass.h"

@implementation SelectionInfoClass
- (void)dealloc {
    [self.selectedArray release];
    [super dealloc];
}

+ (SelectionInfoClass *)selectionWithTestType:(int)testType titleNum:(int)titleNum packName:(NSString *)packName styleName:(NSString *)styleName titleName:(NSString *)titleName quesText:(NSString *)quesText quesImgName:(NSString *)quesImgName answerText:(NSString *)answerText answer:(NSString *)answer handle:(int)handle {
    return [[[self alloc] initWithTestType:testType titleNum:titleNum packName:packName styleName:styleName titleName:titleName quesText:quesText quesImgName:quesImgName answerText:answerText answer:answer handle:handle] autorelease];
}

- (id)initWithTestType:(int)testType titleNum:(int)titleNum packName:(NSString *)packName styleName:(NSString *)styleName titleName:(NSString *)titleName quesText:(NSString *)quesText quesImgName:(NSString *)quesImgName answerText:(NSString *)answerText answer:(NSString *)answer handle:(int)handle {
    self = [super init];
    if (self) {
        self.testType = testType;
        self.titleNum = titleNum;
        self.packName = packName;
        self.styleName = styleName;
        self.titleName = titleName;
        self.quesText = quesText;
        self.quesImgName = quesImgName;
        self.answerTextArray = [answerText componentsSeparatedByString:@"++"];
        self.answerArray = [answer componentsSeparatedByString:@"++"];
        self.selectedArray = [[NSMutableArray alloc] init];
        self.handle = handle;
        
    }
    
    return self;
}

@end
