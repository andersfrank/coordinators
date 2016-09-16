//
//  AppDelegate.m
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import "AppDelegate.h"
#import "StartViewController.h"
#import "StartViewModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    StartViewController *vc = (StartViewController *)self.window.rootViewController;
    vc.viewModel = [StartViewModel new];
    
    return YES;
}

@end
