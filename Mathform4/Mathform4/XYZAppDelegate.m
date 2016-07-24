//
//  XYZAppDelegate.m
//  Mathform4
//
//  Created by Shankar Prajapati on 3/17/14.
//  Copyright (c) 2014 Shankar Prajapati. All rights reserved.
//

#import "XYZAppDelegate.h"
#import "XYZDetailViewController.h"

@implementation XYZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//This method create a view controller to make it still to potrait and landscape on calling
-(NSUInteger) application: (UIApplication*) application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    UINavigationController* ns = (UINavigationController *)self.window.rootViewController;
    if(ns){
        UIViewController* vc = [ns visibleViewController];
        
        if([vc respondsToSelector:@selector(needIos6Landscape)])
            return [vc supportedInterfaceOrientations];
    }
    return UIInterfaceOrientationMaskPortrait;
}

//------------------------

@end
