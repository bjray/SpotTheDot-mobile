//
//  TTSDot.m
//  TSSDotToDotTest
//
//  Created by B.J. Ray on 12/4/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import "TTSDot.h"

@implementation TTSDot

- (id)init {
    self = [super init];
    if (self) {
        self.label = nil;
        self.isEnd = NO;
        self.isStart = NO;
        self.point = CGPointMake(0.0, 0.0);
        self.ordinal = 0;
    }
    return self;
}

-(NSValue *)getPointAsValue {
    return [NSValue valueWithCGPoint:self.point];
}
@end
