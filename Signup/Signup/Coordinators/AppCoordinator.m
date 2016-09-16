//
//  AppCoordinator.m
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "AppCoordinator.h"
#import "StartViewController.h"
#import "StartViewModel.h"
#import "SignUpCoordinator.h"

@interface AppCoordinator ()

@property (nonatomic, strong) StartViewController *startViewController;
@property (nonatomic, strong) NSMutableArray *coordinators;

@end

@implementation AppCoordinator

- (instancetype)initWithStartViewController:(StartViewController *)startViewController {
    self = [super init];
    if (self) {
        _coordinators = [NSMutableArray new];
        _startViewController = startViewController;
        _startViewController.viewModel = [StartViewModel new];
        [_startViewController.viewModel.signUpButtonCommand.executionSignals
            subscribeNext:^(id _) {
                [self startSignupFlow];
            }];
    }
    return self;
}

- (void)startSignupFlow {
    SignUpCoordinator *coordinator = [[SignUpCoordinator alloc] initWithViewController:self.startViewController];
    [self.coordinators addObject:coordinator];
    @weakify(self)
    [coordinator.didSignUp subscribeNext:^(Session *session) {
        @strongify(self)
        self.startViewController.viewModel.session = session;
        [self.startViewController dismissViewControllerAnimated:YES completion:nil];
        [self.coordinators removeObject:coordinator];
    }];
    [coordinator start];
}

@end
