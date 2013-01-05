//
//  TTSCategoryData.m
//  SpotTheDot
//
//  Created by B.J. Ray on 12/28/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import "TTSCategoryData.h"
#import "TTSAppDelegate.h"


@interface TTSCategoryData()
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
- (TTSAppDelegate *)appDelegate;
@end

@implementation TTSCategoryData
@synthesize dataContext, subsetId;
@synthesize managedObjectContext = _managedObjectContext;

- (id)init {
    self = [super init];
    if (self) {
        self.dataContext = TTSDataContextCategory;
    }
    return self;
}


#pragma mark - Protocol Methods
- (NSString *)nameAtIndexPath:(NSIndexPath *) indexPath {
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    return [object valueForKey:@"name"];
}

- (NSString *)idAtIndexPath:(NSIndexPath *) indexPath {
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    return [object valueForKey:@"category_id"];
}

- (NSString *)subtextAtIndexPath:(NSIndexPath *)indexPath {
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSSet *maps = [object valueForKeyPath:@"maps"];
    return [NSString stringWithFormat:@"Available Maps: %d", [maps count]];
}

- (NSInteger)sectionCount {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)numberOfObjectsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex: section];
    
    return [sectionInfo numberOfObjects];
}

- (void)refreshDataSource {
    _fetchedResultsController = nil;
}


#pragma mark - Helper Methods
- (TTSAppDelegate *)appDelegate {
    return (TTSAppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Category"
                                              inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    //Edit sort desriptors
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSFetchedResultsController *contrl = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                             managedObjectContext:self.managedObjectContext
                                                                               sectionNameKeyPath:nil
                                                                                        cacheName:@"Master"];
    contrl.delegate = self;
    self.fetchedResultsController = contrl;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"An Error occurred on CategoryData: %@ %@", error, [error userInfo]);
    }
    return _fetchedResultsController;
}

- (NSManagedObjectContext *)managedObjectContext {
    if(_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    self.managedObjectContext = [[self appDelegate] managedObjectContext];
    return _managedObjectContext;
}

@end
