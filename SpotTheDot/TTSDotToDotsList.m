//
//  TTSDotToDotsList.m
//  TSSDotToDotTest
//
//  Created by B.J. Ray on 12/4/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import "TTSDotToDotsList.h"
#import "TTSMap.h"
#import "TTSDot.h"

@interface TTSDotToDotsList()
//@property (nonatomic, strong) NSMutableArray *dots;
@property (nonatomic, strong) TTSMap *currentMap;
@end

@implementation TTSDotToDotsList

- (id)init {
    self = [super init];
    if (self) {
//        TTSMap *map = [[TTSMap alloc] init];
//        CGPoint ap = map.firstPoint;
//        NSLog(@"check map object for default values");
    }
    return self;
}

- (TTSMap *)currentMap {
    if (!_currentMap) {
//        self.currentMap = [self createStarMap];
//        self.currentMap = [self createButterflyMap];
        self.currentMap = [self createTRexMap];
    }
    
    return _currentMap;
}

#pragma mark - Protocol Methods
- (NSInteger)dotCount {
    return [self.currentMap pointCount];
//    return [self.dots count];
}



#pragma mark - Private Methods
//used to simulate API
- (TTSMap *)createButterflyMap {
    TTSDot *dot;
    TTSMap *aMap = [[TTSMap alloc] init];
    NSMutableArray *localDots = [NSMutableArray array];

    
    aMap.name = @"Butterfly";
    aMap.type = @"Insects";
    aMap.deviceSupport = TTSDeviceSupportBoth;
    aMap.backgroundImage = [UIImage imageNamed:@"butterfly_dot2dot.png"];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(141, 140);
    dot.label = @"A";
    dot.isStart = YES;
    dot.ordinal = 0;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(115, 110);
    dot.label = @"B";
    dot.ordinal = 1;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(84, 87);
    dot.label = @"C";
    dot.ordinal = 2;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(38, 73);
    dot.label = @"D";
    dot.ordinal = 3;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(38, 175);
    dot.label = @"E";
    dot.ordinal = 4;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(47, 195);
    dot.label = @"F";
    dot.ordinal = 5;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(22, 211);
    dot.label = @"G";
    dot.ordinal = 6;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(13, 249);
    dot.label = @"H";
    dot.ordinal = 7;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(41, 276);
    dot.label = @"I";
    dot.ordinal = 8;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(44, 300);
    dot.label = @"J";
    dot.ordinal = 9;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(87, 269);
    dot.label = @"K";
    dot.ordinal = 10;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(90, 292);
    dot.label = @"L";
    dot.ordinal = 11;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(112, 291);
    dot.label = @"M";
    dot.ordinal = 12;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(110, 326);
    dot.label = @"N";
    dot.ordinal = 13;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(133, 318);
    dot.label = @"O";
    dot.ordinal = 14;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(171, 317);
    dot.label = @"P";
    dot.ordinal = 15;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(199, 295);
    dot.label = @"Q";
    dot.ordinal = 16;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(200, 268);
    dot.label = @"R";
    dot.ordinal = 17;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(230, 260);
    dot.label = @"S";
    dot.ordinal = 18;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(289, 193);
    dot.label = @"T";
    dot.ordinal = 19;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(267, 178);
    dot.label = @"U";
    dot.ordinal = 20;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(237, 173);
    dot.label = @"V";
    dot.ordinal = 21;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(195, 172);
    dot.label = @"W";
    dot.ordinal = 22;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(194, 141);
    dot.label = @"X";
    dot.ordinal = 23;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(172, 131);
    dot.label = @"Y";
    dot.ordinal = 24;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(176, 79);
    dot.label = @"Z";
    dot.isEnd = YES;
    dot.ordinal = 25;
    [localDots addObject:dot];
    
    aMap.points = localDots;
    return aMap;
}

- (TTSMap *)createStarMap {
    TTSDot *dot;
    TTSMap *aMap = [[TTSMap alloc] init];
    NSMutableArray *localDots = [NSMutableArray array];
    
    aMap.name = @"Star";
    aMap.type = @"Shapes";
    aMap.deviceSupport = TTSDeviceSupportBoth;
    
    //dot 1
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(80.0, 320.0);
    dot.label = @"A";
    dot.isStart = YES;
    dot.isEnd = YES;
    dot.ordinal = 0;
    [localDots addObject:dot];
    
    //dot 2
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(160.0, 120.0);
    dot.label = @"B";
    dot.ordinal = 1;
    [localDots addObject:dot];
    
    //dot 3
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(240.0, 320.0);
    dot.label = @"C";
    dot.ordinal = 2;
    [localDots addObject:dot];
    
    //dot 4
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(40.0, 200.0);
    dot.label = @"D";
    dot.ordinal = 3;
    [localDots addObject:dot];
    
    //dot 5
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(280.0, 200.0);
    dot.label = @"E";
    dot.ordinal = 4;
//    dot.isEnd = YES;
    [localDots addObject:dot];
    
    aMap.points = localDots;
    return aMap;
}

- (TTSMap *)createTRexMap {
    //scaled
    TTSDot *dot;
    TTSMap *aMap = [[TTSMap alloc] init];
    NSMutableArray *localDots = [NSMutableArray array];
    
    aMap.name = @"T-Rex";
    aMap.type = @"Dinosaurs";
    aMap.deviceSupport = TTSDeviceSupportPad;
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(167, 225);
    dot.label = @"1";
    dot.isStart = YES;
    dot.ordinal = 0;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(176, 204);
    dot.label = @"2";
    dot.ordinal = 1;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(175, 192);
    dot.label = @"3";
    dot.ordinal = 2;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(136, 216);
    dot.label = @"4";
    dot.ordinal = 3;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(102, 234);
    dot.label = @"5";
    dot.ordinal = 4;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(67, 248);
    dot.label = @"6";
    dot.ordinal = 5;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(6, 261);
    dot.label = @"7";
    dot.ordinal = 6;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(43, 241);
    dot.label = @"8";
    dot.ordinal = 7;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(78, 212);
    dot.label = @"9";
    dot.ordinal = 8;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(108, 178);
    dot.label = @"10";
    dot.ordinal = 9;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(129, 148);
    dot.label = @"11";
    dot.ordinal = 10;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(153, 119);
    dot.label = @"12";
    dot.ordinal = 11;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(183, 92);
    dot.label = @"13";
    dot.ordinal = 12;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(211, 85);
    dot.label = @"14";
    dot.ordinal = 13;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(225, 70);
    dot.label = @"15";
    dot.ordinal = 14;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(234, 56);
    dot.label = @"16";
    dot.ordinal = 15;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(253, 51);
    dot.label = @"17";
    dot.ordinal = 16;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(260, 41);
    dot.label = @"18";
    dot.ordinal = 17;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(274, 51);
    dot.label = @"19";
    dot.ordinal = 18;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(289, 51);
    dot.label = @"20";
    dot.ordinal = 19;
    [localDots addObject:dot];
    
    dot = [[TTSDot alloc] init];
    dot.point = CGPointMake(300, 62);
    dot.label = @"21";
    dot.ordinal = 20;
    dot.isEnd = YES;
    [localDots addObject:dot];
    
    aMap.points = localDots;
    return aMap;
}

@end
