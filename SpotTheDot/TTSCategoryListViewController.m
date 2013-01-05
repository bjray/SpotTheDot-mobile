//
//  TTSCategoryListViewController.m
//  SpotTheDot
//
//  Created by B.J. Ray on 12/19/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import "TTSCategoryListViewController.h"
#import "TTSMapListViewController.h"
#import "TTSAppDelegate.h"

@interface TTSCategoryListViewController ()
//@property (nonatomic, strong) TTSCategoryList *categoryList;
@end

@implementation TTSCategoryListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //ask appDelegate for an instance of the dataSource
    TTSAppDelegate *appDelegate = (TTSAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.dataSource = [appDelegate dataSourceForContext:TTSDataContextCategory];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    return [[self.categoryList.fetchedResultsController sections] count];
    return [self.dataSource sectionCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource numberOfObjectsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.dataSource nameAtIndexPath:indexPath];
    cell.detailTextLabel.text = [self.dataSource subtextAtIndexPath:indexPath];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([@"presentMapList" isEqualToString:segue.identifier]) {
        NSIndexPath *index = [self.tableView indexPathForCell: sender];
        UITableViewController *topVC = [segue destinationViewController];
        TTSMapListViewController *mapList = (TTSMapListViewController *)topVC;
        mapList.categoryName = [self.dataSource nameAtIndexPath:index];
        mapList.categoryId = [self.dataSource idAtIndexPath:index];
        NSLog(@"passing Category ID: %@", mapList.categoryId);
    }
}

@end
