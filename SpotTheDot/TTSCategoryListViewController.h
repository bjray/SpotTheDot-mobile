//
//  TTSCategoryListViewController.h
//  SpotTheDot
//
//  Created by B.J. Ray on 12/19/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTSDataSource.h"

@interface TTSCategoryListViewController : UITableViewController
@property (nonatomic, strong) id <TTSDataSource> dataSource;
@end
