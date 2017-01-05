//
//  ViewController.m
//  HelloTeam
//
//  Created by Shankar Prajapati on 10/2/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Person *person1 = [[Person alloc] init];
    [person1 setFirstName:@"lama"];
    [person1 setLastName:@"PANDA"];
    
    person1.age = -1;
    NSLog(@"Age = %d",person1.age);
    
    NSLog(@"My full name is :%@ %@",person1.firstName, person1.lastName);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
