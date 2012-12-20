//
//  TTSMap.h
//  TSSDotToDotTest
//
//  Created by B.J. Ray on 12/5/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTSMapDelegate.h"

@interface TTSMap : NSObject
@property (nonatomic, strong) NSArray *points;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;
@property TTSDeviceSupport deviceSupport;
@property (nonatomic) CGPoint firstPoint;
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) UIImage *dotImage;
@property (nonatomic, weak) id<TTSMapDelegate> delegate;
@property (readonly) float scalar;

- (NSInteger) pointCount;
- (CGPoint) pointAtIndex:(NSInteger) index;
- (NSString *) labelAtIndex:(NSInteger) index;
- (NSValue *) mapValueForPoint: (CGPoint)touchPoint withTolerance: (NSInteger)tolerance;
- (BOOL) checkValidLineWithStartPoint:(CGPoint) startPoint
                             endPoint:(CGPoint) endPoint
                      coordinateCount:(NSInteger)coordCount
                            tolerance:(NSInteger) tolerance;

- (CGRect) mapBounds;
- (void) setScalarForMapRect:(CGRect)mapRect viewRect:(CGRect)viewRect offset:(float)offset;
@end
