//
//  TTSAppDelegate.m
//  SpotTheDot
//
//  Created by B.J. Ray on 12/17/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import "TTSAppDelegate.h"
#import "StackMob.h"
#import "TTSCategoryData.h"
#import "TTSMapData.h"

@interface TTSAppDelegate()
@property (strong, nonatomic) TTSCategoryData *categoryData;
@property (strong, nonatomic) TTSMapData *mapData;
@end

@implementation TTSAppDelegate
@synthesize client = _client;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize managedObjectContext = _managedObjectContext;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.client = [[SMClient alloc] initWithAPIVersion:@"0" publicKey:@"9fe05143-710e-4243-8a7d-85ba58561d5a"];
    SMCoreDataStore *coreDataStore = [ self.client coreDataStoreWithManagedObjectModel:self.managedObjectModel];
    
    self.managedObjectContext = [coreDataStore managedObjectContext];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Data Model Support
- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Map" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (id)dataSourceForContext:(TTSDataContext)dataContext {
    id <TTSDataSource> source;
    
    if (dataContext == TTSDataContextCategory) {
        if (self.categoryData == nil) {
            self.categoryData = [[TTSCategoryData alloc] init];
        }
        source = self.categoryData;
    }
    
    if (dataContext == TTSDataContextMap) {
        if (self.mapData == nil) {
            self.mapData = [[TTSMapData alloc] init];
        }
        source = self.mapData;
    }
    
    return source;
}
@end
