//
//  TTSAppDelegate.h
//  SpotTheDot
//
//  Created by B.J. Ray on 12/17/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "TTSDataSource.h"
#import "TTSCategoryData.h"

@class SMClient;

@interface TTSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) SMClient *client;

- (id)dataSourceForContext:(TTSDataContext)dataContext;
@end
