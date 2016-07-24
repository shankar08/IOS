//
//  XYZDisplaySyllabus.m
//  MathForm4
//
//  Created by Shankar Prajapati on 3/12/14.
//
//

#import "XYZDisplaySyllabus.h"

@implementation XYZDisplaySyllabus


- (void)viewDidLoad
{
    [super viewDidLoad];
    @autoreleasepool {
        
        
        self.title = @"Syllabus";
        
        UIBarButtonItem *NewBackButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
        [[self navigationItem] setBackBarButtonItem:NewBackButton];
        //
        //sets the navigationBarBackground image
        UIImage *navigationBarBAckground = [[UIImage imageNamed:@"background_top.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [[UINavigationBar appearance] setBackgroundImage:navigationBarBAckground forBarMetrics:UIBarMetricsDefault];
        
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MATHEMATICS SYLLABUS Form 1-4" ofType:@"pdf"];
        NSURL *url = [NSURL fileURLWithPath:filePath];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [syllabusView loadRequest:request];
        [syllabusView setScalesPageToFit:YES];
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
-(void) viewDidAppear:(BOOL)animated
{
    
    @autoreleasepool {
        [self.navigationController setNavigationBarHidden:NO animated:normal];
    }
    
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
