//
//  XYZAppDelegate.h
//  MathLearningApp
//
//  Created by Shankar Prajapati on 2/9/14.

#import "XYZHomeViewController.h"
#import "XYZTableViewController.h"

@interface XYZHomeViewController ()


@property NSString * choice;

@end

@implementation XYZHomeViewController

-(IBAction)unwindToHome:(UIStoryboardSegue *)segue{
    
}

//- (IBAction)questionButton:(id)sender {
//    self.choice = @"Questions";
//    [self performSegueWithIdentifier:@"InstructionSegue" sender:nil];
//}
//- (IBAction)solutionButton:(id)sender {
//    self.choice = @"Solutions";
//    [self performSegueWithIdentifier:@"InstructionSegue" sender:nil];
//}
- (IBAction)reviewButton:(id)sender {
    self.choice = @"Reviews";
    [self performSegueWithIdentifier:@"InstructionSegue" sender:nil];
}
//- (IBAction)syllabusButton:(id)sender {
//    self.choice = @"Syllabus";
//    [self performSegueWithIdentifier:@"InstructionSegue" sender:nil];
//}

//---------
-(BOOL) shouldAutorotate{
    return YES;
}
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

//----------
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
        
        UIBarButtonItem *NewBackButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
        [[self navigationItem] setBackBarButtonItem:NewBackButton];
    
    
    //-----------
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
	//---------------------------------
    
    // Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated
{
    
    @autoreleasepool {
        [self.navigationController setNavigationBarHidden:YES animated:animated];
    }
    
}


//------------------

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"InstructionSegue"])
    {

        XYZTableViewController *pg = segue.destinationViewController;
       
        
        pg.choice = self.choice;
        
        
    }
}

@end
