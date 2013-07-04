//
//  AnswerInfoClass.m
//  ProjectS
//
//  Created by zhaozilong on 13-7-5.
//
//

#import "AnswerInfoClass.h"

@interface AnswerInfoClass ()
@end

@implementation AnswerInfoClass

+ (AnswerInfoClass *)answerWithAnswerText:(NSString *)answerText answer:(NSString *)answer quesIndex:(int)index {
    return [[[self alloc] initWithAnswerText:answerText answer:answer quesIndex:index] autorelease];
}

- (id)initWithAnswerText:(NSString *)answerText answer:(NSString *)answer quesIndex:(int)index {
    self = [super init];
    if (self) {
        self.quesIndex = index;
        self.answerTextArray = [answerText componentsSeparatedByString:@"++"];
        self.answerArray = [answer componentsSeparatedByString:@"++"];
    }
    return self;
}

@end
