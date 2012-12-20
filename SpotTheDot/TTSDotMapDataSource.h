//
//  TTSDotMapDataSource.h
//  TSSDotToDotTest
//
//  Created by B.J. Ray on 12/4/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TTSDot;
@class TTSMap;

@protocol TTSDotMapDataSource <NSObject>
- (NSInteger)dotCount;
//- (TTSDot *)dotAtIndex:(NSInteger)index;
//- (NSUInteger)indexOfDot:(TTSDot *)dot;
//- (NSArray *)dots;

- (TTSMap *)currentMap;
@end
