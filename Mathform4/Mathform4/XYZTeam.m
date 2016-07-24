//
//  XYZTeam.m
//  MathForm4
//
//  Created by Shankar Prajapati on 3/10/14.
//
//

#import "XYZTeam.h"

@implementation XYZTeam


- (void)viewDidLoad
{
    [super viewDidLoad];
    //    self.title = self.choice;
    @autoreleasepool {
        
        //        UIBarButtonItem *NewBackButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
//        [[self navigationItem] setBackBarButtonItem:NewBackButton];
//        
        UIImage *navigationBarBAckground = [[UIImage imageNamed:@"background_top.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [[UINavigationBar appearance] setBackgroundImage:navigationBarBAckground forBarMetrics:UIBarMetricsDefault];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"The Team2" ofType:@"pdf"];
        NSURL *url = [NSURL fileURLWithPath:filePath];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [teamView loadRequest:request];
        [teamView setScalesPageToFit:YES];
    }
    
    
}
-(void) viewDidAppear:(BOOL)animated
{
    
    @autoreleasepool {
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    }
    
}

-(void)needIos6Landscape{
    
}
-(BOOL)shouldAutorotate{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}


//------------------

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


@end


