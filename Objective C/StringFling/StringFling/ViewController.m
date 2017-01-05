//
//  ViewController.m
//  StringFling
//
//  Created by Shankar Prajapati on 10/2/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *firstName = @"Mama";
    NSString *allocatedString = [[NSString alloc] init];
    
    
    NSString *fullName = [NSString stringWithFormat:@"%@ Smith %@", firstName, @"Charles III"];
    
    NSLog(@"FullName : %@", fullName);
    
    //string interpolation
    NSLog(@"%@",firstName);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
