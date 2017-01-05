//
//  DetailViewController.m
//  Apple RSS
//
//  Created by Shankar Prajapati on 10/2/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {

        self.title = self.detailItem.title;
        self.releaseDate.text = self.detailItem.releaseDate;
        self.summary.text = self.detailItem.summary;
        self.link.text = self.detailItem.link;
        self.category.text = self.detailItem.category;
        self.price.text = [NSString stringWithFormat:@"%@", self.detailItem.price];
        NSString *temp = self.title;
        
        //This runs in backround thread to let run the main thread
        //Also create local cache for images
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // perform in background thread
            NSData *picData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.detailItem.link]];
            UIImage *loadedImage = [UIImage imageWithData:picData];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (loadedImage) {
                    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                    if(paths.count > 0){
                        NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
                        
                         NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"/"];
                         NSString *fullPath = [NSString stringWithFormat:@"%@%@.png", filePath,temp];
                        if([[NSFileManager defaultManager] createFileAtPath:fullPath contents:picData attributes:nil]){
                            self.imageView.image = [UIImage imageNamed:fullPath];
                        }
                    }
                } else {
                    NSLog(@"Image failed to load");
                }
            });
        });    
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    NSLog(@"LinkIS %@",self.detailItem.link);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(Event *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


- (IBAction)savetoFav:(UIBarButtonItem *)sender {
    
}
@end
