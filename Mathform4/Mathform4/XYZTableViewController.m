//
//  XYZAppDelegate.h
//  MathLearningApp
//
//  Created by Shankar Prajapati on 2/9/14.

#import "XYZTableViewController.h"
#import "XYZDetailViewController.h"

@interface XYZTableViewController ()

@end

@implementation XYZTableViewController
@synthesize pdfFileList,choice;

-(IBAction)unwindToList:(UIStoryboardSegue *)segue{
    
}
//---------------------------

-(BOOL) shouldAutorotate{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

-(void)viewWillAppear:(BOOL)animated{// display the navigation item at the top
    [self.navigationController setNavigationBarHidden:NO animated:normal];
}

//---------------------------
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
    
    
    @autoreleasepool {
        
        self.title = choice;
        
    
    UIBarButtonItem *NewBackButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:NewBackButton];

 //sets the navigationBarBackground image
    UIImage *navigationBarBAckground = [[UIImage imageNamed:@"background_top.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [[UINavigationBar appearance] setBackgroundImage:navigationBarBAckground forBarMetrics:UIBarMetricsDefault];

    //seperator color
    self.tableView.separatorColor = [UIColor colorWithRed:69/255.0 green:127/255.0 blue:177/255.0 alpha:0.5];
    
    
    if([choice isEqualToString:@"Reviews"]){
        
            pdfFileList = [[NSArray alloc] initWithObjects:
                           @"Accounts",
                           @"Albegra",
                           @"Approximations",
                           @"Area and perimeter",
                           @"Congruence",
                           @"Coordinate geometry",
                           @"Decimals",
                           @"Exponents and radicals",
                           @"Fractions",
                           @"Functions",
                           @"Kinematics",
                           @"Latitude and Longitude",
                           @"Linear programming",
                           @"Logarithms",
                           @"Matrices",
                           @"Numbers",
                           @"Percentages",
                           @"Probability",
                           @"Pythagoras theorem",
                           @"Quadratic equations",
                           @"Rates and Variation",
                           @"Ratio, Profit & Loss",
                           @"Real Numbers",
                           @"Relations",
                           @"Sequences and Series",
                           @"Sets",
                           @"Similarity",
                           @"Statistics",
                           @"The Circle",
                           @"Transformation",
                           @"Trigonometry",
                           @"Units",
                           @"Vectors",
                           nil];
        
        
//    }else if([choice isEqualToString:@"Syllabus"]){
//        
//        pdfFileList = [[NSArray alloc] initWithObjects:@"MATHEMATICS SYLLABUS Form 1-4", nil];
    }else if([choice isEqualToString:@"Questions"]){
       
            pdfFileList = [[NSArray alloc] initWithObjects:
                           @"2013 Exam Questions",
                           @"2012 Exam Questions",
                           @"2011 Exam Questions",
                           @"2010 Exam Questions",
                           @"2009 Exam Questions",
                           @"2008 Exam Questions",
                           @"2007 Exam Questions",
                           @"2006 Exam Questions",
                           @"2005 Exam Questions",
                           @"2004 Exam Questions",
                           @"2003 Exam Questions",
                           @"2002 Exam Questions",
                           @"2001 Exam Questions",
                           @"2000 Exam Questions",
                           @"1999 Exam Questions",
                           @"1998 Exam Questions",
                           @"1997 Exam Questions",
                           @"1996 Exam Questions",
                           @"1995 Exam Questions",
                           @"1994 Exam Questions",
                           @"1993 Exam Questions",
                           @"1992 Exam Questions",
                           @"1991 Exam Questions",
                           nil];
       
        
    }else if([choice isEqualToString:@"Solutions"]){
       
            pdfFileList = [[NSArray alloc] initWithObjects:
                           @"2012 Exam Solution",
                           @"2011 Exam Solution",
                           @"2009 Exam Solution",
                           @"2008 Exam Solution",
                           @"2007 Exam Solution",
                           @"2006 Exam Solution",
                           @"2005 Exam Solution",
                           @"2004 Exam Solution",
                           @"2003 Exam Solution",
                           @"2002 Exam Solution",
                           @"2001 Exam Solution",
                           @"2000 Exam Solution",
                           @"1999 Exam Solution",
                           @"1998 Exam Solution",
                           @"1997 Exam Solution",
                           @"1996 Exam Solution",
                           @"1995 Exam Solution",
                           @"1994 Exam Solution",
                           @"1993 Exam Solution",
                           @"1992 Exam Solution",
                           @"1991 Exam Solution",
                           nil];
        
    
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
   
    
    
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    
    
    return pdfFileList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @autoreleasepool {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //set the text attribute to whatever we are currently looking at in our array
    cell.textLabel.text = [pdfFileList objectAtIndex:indexPath.row];
    // Configure the cell...
    
    //set the detail disclosure indicator
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    }
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


-(void )prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //create an instance of our DetailViewController
    
    XYZDetailViewController *DVC = [[XYZDetailViewController alloc ]init];
    
    //set the DVC to the destinationViewController proper of the segue
    DVC = [segue destinationViewController];
    
    //Get the indexpath
    
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    NSString * theCharacter = [pdfFileList objectAtIndex:path.row];
    
    DVC.pdfFileNumber = path.row;
    DVC.pdfFileName = theCharacter;
}
/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

//-(void)tableView: (UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    XYZDetailViewController *DVC = [[XYZDetailViewController alloc ] init];
//    DVC.characterName = [characterList objectAtIndex:indexPath.row];
//    
//    DVC.characterNumber = [indexPath row];
//    
//    
//    //Pass the selected object to the view controller
//    [self.navigationController pushViewController:DVC animated:YES];
//    
//}

@end
