//
//  TTSDot.h
//  TSSDotToDotTest
//
//  Created by B.J. Ray on 12/4/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTSDot : NSObject
@property(nonatomic) CGPoint point;
@property(nonatomic) NSInteger ordinal;
@property(nonatomic) BOOL isEnd;
@property(nonatomic) BOOL isStart;
@property(nonatomic, strong) NSString *label;

-(NSValue *)getPointAsValue;
@end
