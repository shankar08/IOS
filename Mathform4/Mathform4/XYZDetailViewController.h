//
//  XYZAppDelegate.h
//  MathLearningApp
//
//  Created by Shankar Prajapati on 2/9/14.

#import <UIKit/UIKit.h>

@interface XYZDetailViewController : UIViewController{
    
}

@property (weak, nonatomic) IBOutlet UIWebView *pdfView;

@property int pdfFileNumber;
@property (strong, nonatomic) NSString *pdfFileName;

-(void)needIos6Landscape;

@end
