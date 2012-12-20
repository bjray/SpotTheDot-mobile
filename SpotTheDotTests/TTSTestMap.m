//
//  TTSTestMap.m
//  SpotTheDot
//
//  Created by B.J. Ray on 12/18/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import "TTSTestMap.h"
#import "TTSMap.h"
#import "TTSDot.h"

@interface TTSTestMap()
@property (nonatomic, strong) TTSMap *map;
@end

@implementation TTSTestMap
- (void)setUp
{
    [super setUp];
    
    TTSDot *dot;
    self.map = [[TTSMap alloc] init];
    NSMutableArray *localDots = [NSMutableArray array];
    
    self.map.name = @"Square";
    self.map.type = @"Shapes";
    self.map.deviceSupport = TTSDeviceSupportBoth;
    
    //dot 1
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(0, 0);
    dot.label = @"A";
    dot.isStart = YES;
    dot.isEnd = YES;
    dot.ordinal = 0;
    [localDots addObject:dot];
    
    //dot 2
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(100, 0);
    dot.label = @"B";
    dot.ordinal = 1;
    [localDots addObject:dot];
    
    //dot 3
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(100, 100);
    dot.label = @"C";
    dot.ordinal = 2;
    [localDots addObject:dot];
    
    //dot 4
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(0, 100);
    dot.label = @"D";
    dot.ordinal = 3;
    [localDots addObject:dot];
    
    self.map.points = localDots;

}

- (void)tearDown
{
    // Tear-down code here.
    self.map = nil;
    [super tearDown];
}


- (void)testMapAttributes
{
    STAssertEquals(self.map.name, @"Square", @"Failed to return proper name.");
    
}

#pragma mark - Map Point Tests
- (void)testPointCount {
    STAssertEquals(self.map.pointCount, 4, @"Failed to return proper point count.");
}

-(void)testFirstAndLastPoint {
    CGPoint p1;
    CGPoint p2;
    p1 = self.map.firstPoint;
    p2 = self.map.lastPoint;
    STAssertEqualObjects([NSValue valueWithCGPoint:p1], [NSValue valueWithCGPoint:CGPointMake(0, 0)], @"Failed to fetch first point");
    STAssertEqualObjects([NSValue valueWithCGPoint:p2], [NSValue valueWithCGPoint:CGPointMake(0, 100.0)], @"Failed to fetch first point");
}

- (void)testMapBounds {
    NSValue *boundsVal = [NSValue valueWithCGRect:[self.map mapBounds]];
    CGRect rect = CGRectMake(0.0, 0.0, 100.0, 100.0);
    STAssertEqualObjects(boundsVal, [NSValue valueWithCGRect:rect], @"Failed to gather map boundaries.");
}

- (void)testScalingFunction {
    //scale by 1/2 (50%)
    
    CGRect vRect = CGRectMake(0, 0, 50.0, 50.0);
    [self.map setScalarForMapRect:[self.map mapBounds] viewRect:vRect offset:0];
    STAssertEquals(self.map.scalar, 0.5f, @"Failed scaling map to 50%");
}


- (void)testMapScale {
    NSValue *pointVal = nil;

    CGRect vRect = CGRectMake(0, 0, 50.0, 50.0);
    [self.map setScalarForMapRect:[self.map mapBounds] viewRect:vRect offset:0];
    
    
    CGPoint p1 = [self.map pointAtIndex:0]; // lower right corner
    pointVal = [NSValue valueWithCGPoint:p1];
    STAssertEqualObjects(pointVal, [NSValue valueWithCGPoint:CGPointMake(0.0, 0.0f)], @"Failed scaling point 0");
    
    p1 = [self.map pointAtIndex:1]; // lower right corner
    pointVal = [NSValue valueWithCGPoint:p1];
    STAssertEqualObjects(pointVal, [NSValue valueWithCGPoint:CGPointMake(50.0f, 0.0f)], @"Failed scaling point 1");
    
    p1 = [self.map pointAtIndex:2]; // lower right corner
    pointVal = [NSValue valueWithCGPoint:p1];
    STAssertEqualObjects(pointVal, [NSValue valueWithCGPoint:CGPointMake(50.0f, 50.0f)], @"Failed scaling point 2");
    
    p1 = [self.map pointAtIndex:3]; // lower right corner
    pointVal = [NSValue valueWithCGPoint:p1];
    STAssertEqualObjects(pointVal, [NSValue valueWithCGPoint:CGPointMake(0.0f, 50.0f)], @"Failed scaling point 3");

}

- (void)testMapLabelsForPoints {
    NSString *label = nil;
    label = [self.map labelAtIndex:0];
    STAssertEquals(label, @"A", @"Failed getting correct label for point 1");
    
    label = [self.map labelAtIndex:1];
    STAssertEquals(label, @"B", @"Failed getting correct label for point 2");
    
    label = [self.map labelAtIndex:2];
    STAssertEquals(label, @"C", @"Failed getting correct label for point 3");
    
    label = [self.map labelAtIndex:3];
    STAssertEquals(label, @"D", @"Failed getting correct label for point 4");
}

- (void)testMapValueForPoint {
    CGPoint badPoint = CGPointMake(90, 90);
    CGPoint goodPoint = CGPointMake(100, 100);
    NSInteger tolerance = 10;

    NSValue *pointVal = [self.map mapValueForPoint:badPoint withTolerance:tolerance];
    STAssertNil(pointVal, @"Failed - false point should have returned nil");
    
    //in tolerance on x, not y
    pointVal = [self.map mapValueForPoint:CGPointMake(91, 89) withTolerance:tolerance];
    STAssertNil(pointVal, @"Failed - X within tolerance, but not y");
    
    //in tolerance on y, not x
    //in tolerance on x, not y
    pointVal = [self.map mapValueForPoint:CGPointMake(89, 91) withTolerance:tolerance];
    STAssertNil(pointVal, @"Failed - X within tolerance, but not y");
    
    //in tolerance
    //in tolerance on x, not y
    pointVal = [self.map mapValueForPoint:CGPointMake(91, 91) withTolerance:tolerance];
    STAssertEqualObjects(pointVal, [NSValue valueWithCGPoint:goodPoint], @"Failed - should match points");
}


- (void)testcheckValidLine {
    CGPoint p0;
    CGPoint p1;
    CGPoint p2;
    CGPoint p3;

    p0 = CGPointMake(9, 9);  // ordinal 0
    p1 = CGPointMake(91, 9); // ordinal 1
    p2 = CGPointMake(91, 91); // ordinal 2
    p3 = CGPointMake(9, 91); // ordinal 3


    //test ordinal parameter...
    STAssertFalse([self.map checkValidLineWithStartPoint:p1 endPoint:p2 coordinateCount:1 tolerance:10], @"Failed - returned line when coordinate count was incorrect");
    
    
    //test point order...
    STAssertFalse([self.map checkValidLineWithStartPoint:p1 endPoint:p3 coordinateCount:3 tolerance:10], @"Failed - returned line when points where not consecutive - skipped point");
    
    STAssertFalse([self.map checkValidLineWithStartPoint:p2 endPoint:p1 coordinateCount:1 tolerance:10], @"Failed - returned line when points where not consecutive - reverse order");
    
    STAssertFalse([self.map checkValidLineWithStartPoint:p2 endPoint:p1 coordinateCount:2 tolerance:10], @"Failed - returned line when points where not consecutive (reverse order) and wrong coordinate count");
    
    
    //check tolerance
    STAssertFalse([self.map checkValidLineWithStartPoint:p1 endPoint:p2 coordinateCount:2 tolerance:5], @"Failed - returned line when points were outside tolerance");
    
    
    
    //testing correct parameters...
    STAssertTrue([self.map checkValidLineWithStartPoint:p1 endPoint:p2 coordinateCount:2 tolerance:10], @"Failed - did not validate line when points are within tolerance, sequential, and porper coordinate count");
    
    
    STAssertTrue([self.map checkValidLineWithStartPoint:p3 endPoint:p0 coordinateCount:4 tolerance:10], @"Failed - did not validate line when points are within tolerance, sequential, and porper coordinate count");
    


}
@end
