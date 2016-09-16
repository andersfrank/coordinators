//
//  AppDelegate.m
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import "AppDelegate.h"
#import "StartViewController.h"
#import "AppCoordinator.h"

@interface AppDelegate ()

@property (nonatomic) AppCoordinator *appCoordinator;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.appCoordinator = [[AppCoordinator alloc] initWithStartViewController:(StartViewController *)self.window.rootViewController];
    
    return YES;
}

@end
