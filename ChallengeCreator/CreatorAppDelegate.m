//
//  CreatorAppDelegate.m
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/4/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import "CreatorAppDelegate.h"
#import <Parse/Parse.h>
#import "HappySignupViewController.h"

@implementation CreatorAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    /*****                                        *****/
    /***** from Parse Dashboard: Application keys *****/
    /*****      *****/
    [Parse setApplicationId:@"pvJll9oJhI8ggEF4lTN7J07bBj7VB7rw4fBp8vyh"
                  clientKey:@"4kOhk0rB3Vd53uZH55vnZsS8a9DMgF4ZYidaCtvG"];
    
    //****************************************************************
    // Used to control which users can access or modify a particular
    // object:
    //****************************************************************
    PFACL *defaultACL = [PFACL ACL];
    [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    
    
    //
    // Get cached currentUser, if it was created already
    //
    PFUser *currentUser = [PFUser currentUser];
    
    // this would delete the current user and let you switch users
    //    [PFUser logOut];
    
    if (currentUser)
    {
        NSLog(@"User exists so continue as usual");
        
        application.applicationIconBadgeNumber = 0;
        
        // Handle launching from a notification
        UILocalNotification *localNotif =
        [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
        if (localNotif) {
            NSLog(@"Recieved Notification %@",localNotif);
        }
    }
    //
    // Go to signup
    //
    else
    {
        NSLog(@"User does not exist");
        
        _viewController = [[HappySignupViewController alloc] initWithNibName:@"HappySignupViewController" bundle:nil];
        
        self.window.rootViewController = _viewController;
        
        
    }
    
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

@end
