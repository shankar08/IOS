//
//  XYZPastPaperViewController.m
//  MathForm4
//
//  Created by Shankar Prajapati on 3/9/14.
//
//

#import "XYZPastPaperViewController.h"
#import "XYZTableViewController.h"

@interface XYZPastPaperViewController ()


@property NSString * choice;

@end

@implementation XYZPastPaperViewController

-(IBAction)unwindToPastPapers:(UIStoryboardSegue *)segue{
    
}
- (IBAction)questionButton:(id)sender {
    self.choice = @"Questions";
    [self performSegueWithIdentifier:@"InstructionSegue" sender:Nil];
}

- (IBAction)solutionButton:(id)sender {
    self.choice = @"Solutions";
    [self performSegueWithIdentifier:@"InstructionSegue" sender:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.title = self.choice;
    @autoreleasepool {
        UIBarButtonItem *NewBackButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
        [[self navigationItem] setBackBarButtonItem:NewBackButton];
        
        UIImage *navigationBarBAckground = [[UIImage imageNamed:@"background_top.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [[UINavigationBar appearance] setBackgroundImage:navigationBarBAckground forBarMetrics:UIBarMetricsDefault];
        
        
    }
  
  
}
-(void) viewDidAppear:(BOOL)animated
{
    
    @autoreleasepool {
        [self.navigationController setNavigationBarHidden:NO animated:animated];
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

