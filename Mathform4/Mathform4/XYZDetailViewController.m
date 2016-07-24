//
//  XYZAppDelegate.h
//  MathLearningApp
//
//  Created by Shankar Prajapati on 2/9/14.

#import "XYZDetailViewController.h"

@interface XYZDetailViewController ()

@end

@implementation XYZDetailViewController
@synthesize pdfView, pdfFileName, pdfFileNumber;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}
//----------------------------------
//---------last Edited
//----------------------------------
-(void)needIos6Landscape{
    
}
-(BOOL)shouldAutorotate{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}
//
//-(void)toggleNavBar:(UITapGestureRecognizer *)gesture{
//    @autoreleasepool {
//        BOOL barsHidden = self.navigationController.navigationBar.hidden;
//        [self.navigationController setNavigationBarHidden:!barsHidden animated:YES];
//    }
//    
//}

//----------------------------------
//---- Last edited
//----------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];
    @autoreleasepool {
        
        
        self.title = pdfFileName;
        
        UIBarButtonItem *NewBackButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
        [[self navigationItem] setBackBarButtonItem:NewBackButton];
        
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:pdfFileName ofType:@"pdf"];
        NSURL *url = [NSURL fileURLWithPath:filePath];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [pdfView loadRequest:request];
        [pdfView setScalesPageToFit:YES];
    }
   
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 
@end
