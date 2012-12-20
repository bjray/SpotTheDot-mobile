//
//  TTSMapDelegate.h
//  TSSDotToDotTest
//
//  Created by B.J. Ray on 12/11/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TTSMap;

@protocol TTSMapDelegate <NSObject>
- (void)gameWonForMap:(TTSMap *)map;
@end
