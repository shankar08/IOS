//
//  DetailViewController.h
//  Apple RSS
//
//  Created by Shankar Prajapati on 10/2/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Apple_RSS+CoreDataModel.h"
#import "MasterViewController.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Event *detailItem;

@property (weak, nonatomic) IBOutlet UITextView *summary;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *releaseDate;
@property (weak, nonatomic) IBOutlet UILabel *price;

@property (weak, nonatomic) IBOutlet UILabel *category;
@property (weak, nonatomic) IBOutlet UILabel *link;
- (IBAction)savetoFav:(UIBarButtonItem *)sender;


@end

