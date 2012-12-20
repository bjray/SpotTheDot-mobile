//
//  TTSMap.m
//  TSSDotToDotTest
//
//  Created by B.J. Ray on 12/5/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import "TTSMap.h"
#import "TTSDot.h"

@interface TTSMap()
- (BOOL)validateLineFromDot:(TTSDot *)firstDot toDot:(TTSDot *)lastDot;

@end


@implementation TTSMap

- (id)init {
    self = [super init];
    if (self) {
        self.points = [NSArray array];
        self.name = @"New map";
        self.type = @"General";
//        self.hiRes = NO;
        _scalar = 1.0;
    }
    return self;
}

//will replace with a designated initializer...maybe
#pragma mark - Convenience Methods
- (NSInteger) pointCount {
    return [self.points count];
}

- (CGPoint) pointAtIndex:(NSInteger) index {
    CGPoint point = CGPointMake(0.0, 0.0);
    CGFloat x = 0;
    CGFloat y = 0;
    TTSDot *dot = [self.points objectAtIndex:index];
    if (nil != dot) {
        x = dot.point.x * self.scalar;
        y = dot.point.y * self.scalar;
        point = CGPointMake(x, y);
    }
    
    return point;
}

- (NSString *) labelAtIndex:(NSInteger) index {
    TTSDot *aDot = [self.points objectAtIndex:index];
    NSString *label = nil;
    
    if (nil != aDot) {
        label = aDot.label;
    } else {
        label = [NSString stringWithFormat:@"%i", index];
    }
    
    return label;
}

- (NSValue *)mapValueForPoint: (CGPoint)touchPoint withTolerance: (NSInteger)tolerance {
    NSValue *valPoint = nil;
    CGFloat x = 0;
    CGFloat y = 0;
    CGRect touchRect;
    TTSDot *aDot = nil;
    
    touchRect = CGRectMake(touchPoint.x - (tolerance/2), touchPoint.y - (tolerance/2), tolerance, tolerance);
    
    aDot = [self dotInRect:touchRect withTolerance:tolerance];
    if (nil != aDot) {
        x = aDot.point.x * self.scalar;
        y = aDot.point.y * self.scalar;
        valPoint = [NSValue valueWithCGPoint:CGPointMake(x, y)];
    }
    return valPoint;
}

- (BOOL)checkValidLineWithStartPoint:(CGPoint) startPoint
                            endPoint:(CGPoint) endPoint
                         coordinateCount:(NSInteger)coordCount
                           tolerance:(NSInteger) tolerance {
    
    BOOL success = NO;
    CGRect startTouchRect;
    CGRect endTouchRect;
    TTSDot *startDot;
    TTSDot *endDot;
    
    
    startTouchRect = CGRectMake(startPoint.x - (tolerance/2), startPoint.y - (tolerance/2), tolerance, tolerance);
    endTouchRect = CGRectMake(endPoint.x - (tolerance/2), endPoint.y - (tolerance/2), tolerance, tolerance);
    
    
    startDot = [self dotInRect:startTouchRect withTolerance:tolerance];
    endDot = [self dotInRect:endTouchRect withTolerance:tolerance];

    NSLog(@"startDot: %d, endDot: %d, lastOrdinal: %d, point count: %d", startDot.ordinal, endDot.ordinal, coordCount, [self pointCount]);

    
    if (endDot.ordinal - startDot.ordinal == 1) {
        if ((coordCount == 0) && (startDot.ordinal == 0)) {
            success = YES;
        } else if(endDot.ordinal == coordCount) {
            success = YES;
        }
        if (success && endDot.isEnd) {
            [self.delegate gameWonForMap:self];
        }
    } else if((startDot.ordinal == coordCount - 1) && endDot.isStart) {
        success = YES;
        //Game won!
        [self.delegate gameWonForMap:self];
    }
    
    return success;
}




- (void)setScalarForMapRect:(CGRect)mapRect viewRect:(CGRect)viewRect offset:(float)offset {
    float wf = 0;
    float hf = 0;
    
    NSLog(@"viewRect: origin: (%f,%f), width: %f, height: %f", viewRect.origin.x,viewRect.origin.y, viewRect.size.width,viewRect.size.height);
    
    NSLog(@"mapRect: origin: (%f,%f), width: %f, height: %f", mapRect.origin.x,mapRect.origin.y, mapRect.size.width,mapRect.size.height);
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        NSLog(@"iPhone");
    } else if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        NSLog(@"iPad");
    } else {
        NSLog(@"unknown");
    }
    wf = (viewRect.size.width - offset) / mapRect.size.width;
    hf = (viewRect.size.height - offset) / mapRect.size.height;
    
    _scalar = MIN(wf, hf);
    NSLog(@"width factor: %f, height factor: %f", wf, hf);
    NSLog(@"selected scalar: %f", self.scalar);
    
}


#pragma mark - Property Overrides
- (CGPoint)firstPoint {
    _firstPoint = CGPointMake(0, 0);
    CGFloat x = 0;
    CGFloat y = 0;
    
    TTSDot *firstDot = [self.points objectAtIndex:0];

    if (nil != firstDot) {
        x = firstDot.point.x * self.scalar;
        y = firstDot.point.y * self.scalar;
        _firstPoint = CGPointMake(x, y);
    }
    
    return _firstPoint;
}

- (CGPoint)lastPoint {
    _lastPoint = CGPointMake(0, 0);
    CGFloat x = 0;
    CGFloat y = 0;
    
    TTSDot *lastDot = [self.points lastObject];
    
    if (nil != lastDot) {
        x = lastDot.point.x * self.scalar;
        y = lastDot.point.y * self.scalar;
        _lastPoint = CGPointMake(x, y);
    }
    
    return _lastPoint;
}


#pragma mark - Private Methods
- (TTSDot *)dotInRect:(CGRect)rect withTolerance: (NSInteger) tolerance {
    CGRect dotRect;
    CGFloat x = 0;
    CGFloat y = 0;
    TTSDot *resultDot = nil;
    
    for (TTSDot *dot in self.points) {
        x = dot.point.x * self.scalar;
        y = dot.point.y * self.scalar;
        dotRect = CGRectMake(x - (tolerance/2), y - (tolerance/2), tolerance, tolerance);
        
        if (CGRectIntersectsRect(rect, dotRect)) {
            resultDot = dot;
            break;
        }
    }
    
    return resultDot;
}

- (BOOL)validateLineFromDot:(TTSDot *)firstDot toDot:(TTSDot *)lastDot {
    BOOL isValid = NO;
    
    //ordinalEnd - ordinalStart == 1
    
    if (lastDot.ordinal - firstDot.ordinal == 0) {
        isValid = YES;
    } else {
        
    }
    return isValid;
}


//assumes original map has origin at 0,0
- (CGRect)mapBounds {
    CGFloat maxX = 0;
    CGFloat maxY = 0;
    
    for (TTSDot *aDot in self.points) {
        if (aDot.point.x > maxX) {
            maxX = aDot.point.x;
        }
        if (aDot.point.y > maxY) {
            maxY = aDot.point.y;
        }
    }
    
    NSLog(@"maxX: %f, maxY: %f", maxX, maxY);
    return CGRectMake(0, 0, maxX, maxY);
}

@end
