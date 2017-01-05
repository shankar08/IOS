//
//  Person.m
//  HelloTeam
//
//  Created by Shankar Prajapati on 10/2/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)test{
    self.firstName = @"Lambda";
    
  //instance varriable
    
    _firstName = @"Mango";
    
    realAge = 21;
}
//setting the setters
-(void)setAge:(int)age{
    if(age > _age){
        _age = age;
    }
}
//Setting the getters
-(NSString*)lastName{
    if ([_lastName isEqualToString:@"PANDA"]){
        return @"lambda";
    }else {
        return _lastName;
    }
}

@end
