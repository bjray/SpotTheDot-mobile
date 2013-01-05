//
//  TTSMapData.m
//  SpotTheDot
//
//  Created by B.J. Ray on 12/28/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import "TTSMapData.h"
#import "TTSAppDelegate.h"

@interface TTSMapData()
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
- (TTSAppDelegate *)appDelegate;

@end

@implementation TTSMapData
@synthesize dataContext, subsetId;
@synthesize managedObjectContext = _managedObjectContext;


#pragma mark - Protocol Methods
//TODO: subclass?
- (NSString *)nameAtIndexPath:(NSIndexPath *) indexPath {
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSLog(@"getting name");

    return [object valueForKey:@"name"];
}

- (NSString *)idAtIndexPath:(NSIndexPath *) indexPath {
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSLog(@"getting id");
    return [object valueForKey:@"map_id"];
}

- (NSString *)subtextAtIndexPath:(NSIndexPath *)indexPath {
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSSet *dots = [object valueForKeyPath:@"label_set"];
    NSLog(@"getting subtext");
    return [NSString stringWithFormat:@"Map Size: %d", [dots count]];
}

//TODO: subclass?
- (NSInteger)sectionCount {
    NSLog(@"getting section count");
    return [[self.fetchedResultsController sections] count];
}

//TODO: subclass?
- (NSInteger)numberOfObjectsInSection:(NSInteger)section {
    NSLog(@"getting number of objects in section");

    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex: section];
    
    return [sectionInfo numberOfObjects];
}

//TODO: Subclass?
- (void)refreshDataSource {
    _fetchedResultsController = nil;
}



#pragma mark - Helper Methods
//TODO: subclass?
- (TTSAppDelegate *)appDelegate {
    return (TTSAppDelegate *)[[UIApplication sharedApplication] delegate];
}

//TODO: subclass?
- (NSManagedObjectContext *)managedObjectContext {
    if(_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    self.managedObjectContext = [[self appDelegate] managedObjectContext];
    return _managedObjectContext;
}

//TODO: could be refactored for subclass
- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Map"
                                              inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    //Edit sort desriptors
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];

    NSLog(@"subset ID: %@", self.subsetId);
    
    if (self.subsetId != nil) {
        NSLog(@"setting new predicate");
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", self.subsetId];
        [fetchRequest setPredicate:predicate];
    }
    
    NSFetchedResultsController *contrl = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                             managedObjectContext:self.managedObjectContext
                                                                               sectionNameKeyPath:nil
                                                                                        cacheName:[NSString stringWithFormat:@"Category_%@", self.subsetId]];
    contrl.delegate = self;
    self.fetchedResultsController = contrl;
    NSLog(@"Fresh copy of fetched results: %@", contrl);
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"An Error occurred on MapData: %@ %@", error, [error userInfo]);
    }
    return _fetchedResultsController;
}



@end
