//
//  MasterViewController.m
//  Apple RSS
//
//  Created by Shankar Prajapati on 10/2/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSManagedObjectContext* context = [self managedObjectContext];
    
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"https://itunes.apple.com/us/rss/topgrossingapplications/limit=50/json"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if(json[@"feed"]){
        NSDictionary *apps = json[@"feed"];
        
        if(apps[@"entry"]){
            NSArray *entries = apps[@"entry"];
    
            //Fetching the result and clearing everything if there is anything in the core data
            NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Posts"];
            request.returnsObjectsAsFaults = false;
            NSError *error;
            NSArray *items = [context executeFetchRequest:request error:&error];
            
            for (NSManagedObject *managedObject in items) {
                [context deleteObject:managedObject];
                [context save:&error];
            }
            
            for (NSDictionary *entry in entries)
            {
                NSManagedObject *newPost = [NSEntityDescription insertNewObjectForEntityForName:@"Posts" inManagedObjectContext:context];
                
                //for title
                NSDictionary *Rtitle = entry[@"title"];
                NSString *title = Rtitle[@"label"];
                
                [newPost setValue:title forKey:@"title"];
                NSError* error;
                
                //for summary
                NSDictionary *Rsummary = entry[@"summary"];
                NSString *summary = Rsummary[@"label"];
                [newPost setValue:summary forKey:@"summary"];
                
                //for price
                NSDictionary *Rprice = entry[@"im:price"];
                if(Rprice[@"attributes"]){
                    NSDictionary *prices = Rprice[@"attributes"];
                    
                    if(prices[@"amount"]){
                        NSString *cost = prices[@"amount"];
                        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
                        f.numberStyle = NSNumberFormatterDecimalStyle;
                        NSNumber *myNumber = [f numberFromString:cost];
                        [newPost setValue:myNumber forKey:@"price"];
                        
                    }
                }
                
                //for link
                NSDictionary *Rlink = entry[@"link"];
                if(Rlink[@"attributes"]){
                    NSDictionary *tempLink = Rlink[@"attributes"];
                    if(tempLink[@"href"]){
                        NSString *link = tempLink[@"href"];
                        [newPost setValue:link forKey:@"link"];
                    }
                }
                
                //for category
                NSDictionary *Rcategory = entry[@"category"];
                if(Rcategory[@"attributes"]){
                    NSDictionary *tempc = Rcategory[@"attributes"];
                    if(tempc[@"label"]){
                        NSString *category = tempc[@"label"];
                        [newPost setValue:category forKey:@"category"];
                    }
                }
                
                //for release date im:releaseDate
                NSDictionary *Rdate = entry[@"im:releaseDate"];
                if(Rdate[@"attributes"]){
                    NSDictionary *tempdate = Rdate[@"attributes"];
                    if(tempdate[@"label"]){
                        NSString *date = tempdate[@"label"];
                        [newPost setValue:date forKey:@"releaseDate"];
                    }
                }
                
            //for images
                NSArray *RImageL = entry[@"im:image"];
                if(RImageL[2]){
                    NSDictionary *RImage = RImageL[2];
                    NSString *imageLink = RImage[@"label"];
                    [newPost setValue:imageLink forKey:@"link"];
                }
                
                [context save:&error];
             }
        }
    }
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Event *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Event *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [self configureCell:cell withEvent:event];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
            
        NSError *error = nil;
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, error.userInfo);
            abort();
        }
    }
}


- (void)configureCell:(UITableViewCell *)cell withEvent:(Event *)event {
    cell.textLabel.text = event.title.description;
}


#pragma mark - Fetched results controller

- (NSFetchedResultsController<Event *> *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest<Event *> *fetchRequest = Event.fetchRequest;
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:NO];

    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController<Event *> *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    
    NSError *error = nil;
    if (![aFetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
    
    _fetchedResultsController = aFetchedResultsController;
    return _fetchedResultsController;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            return;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] withEvent:anObject];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

/*
// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
 */

@end
