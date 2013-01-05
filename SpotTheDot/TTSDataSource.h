//
//  TTSDataSource.h
//  SpotTheDot
//
//  Created by B.J. Ray on 12/28/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTSDataSource <NSObject>
//tableview support methods.  These need a context of Category, Map, or Dots. Use an Enum?
- (NSString *)nameAtIndexPath:(NSIndexPath *) indexPath;
- (NSString *)idAtIndexPath:(NSIndexPath *) indexPath;
- (NSString *)subtextAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)sectionCount;
- (NSInteger)numberOfObjectsInSection:(NSInteger)section;
- (void)refreshDataSource;
// - thumbnailImageAtIndexPath

@property TTSDataContext dataContext;
@property (nonatomic, strong) NSString *subsetId;
@end
