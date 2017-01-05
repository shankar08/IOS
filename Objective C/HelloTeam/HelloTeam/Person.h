//
//  Person.h
//  HelloTeam
//
//  Created by Shankar Prajapati on 10/2/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    BOOL realAge;
}

@property (atomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic) int age;

@end
