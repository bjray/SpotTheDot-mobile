//
//  TTSMapListViewController.h
//  SpotTheDot
//
//  Created by B.J. Ray on 12/20/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTSDataSource.h"

@interface TTSMapListViewController : UITableViewController
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *categoryId;
@property (nonatomic, strong) id <TTSDataSource> dataSource;
@end
