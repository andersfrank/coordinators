//
//  SignUpCoordinator.m
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

#import "SignUpCoordinator.h"
#import "EnterEmailViewModel.h"
#import "EnterEmailViewController.h"
#import "EnterPasswordViewController.h"
#import "EnterPasswordViewModel.h"
#import "Session.h"

@interface SignUpCoordinator ()

@property (nonatomic) UIViewController *viewController;
@property (nonatomic) UINavigationController *navigationController;
@property (nonatomic) NSString *email;
@property (nonatomic) RACSubject *didSignUpSubject;

@end

@implementation SignUpCoordinator

- (instancetype)initWithViewController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        _viewController = viewController;
        self.didSignUpSubject = [RACSubject new];
        self.didSignUp = [self.didSignUpSubject takeUntil:self.rac_willDeallocSignal];
    }
    return self;
}

- (void)start {
    [self presentEnterEmailController];
}

- (void)presentEnterEmailController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EnterEmailViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(EnterEmailViewController.class)];
    vc.viewModel = [EnterEmailViewModel new];
    @weakify(self)
    [vc.viewModel.doneButtonCommand.executionSignals.flatten subscribeNext:^(NSString *email) {
        @strongify(self)
        self.email = email;
        [self presentEnterPasswordController];
    }];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.viewController presentViewController:self.navigationController animated:YES completion:nil];
}

- (void)presentEnterPasswordController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EnterPasswordViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(EnterPasswordViewController.class)];
    vc.viewModel = [[EnterPasswordViewModel alloc] init];
    
    @weakify(self)
    [[vc.viewModel.signUpCommand.executionSignals.flatten
        flattenMap:^RACStream *(NSString *password) {
            @strongify(self)
            return [self signupWithEmail:self.email password:password];
        }]
        subscribe:self.didSignUpSubject];
    [self.navigationController pushViewController:vc animated:YES];
}

// A signal representing a sign up. Will return a Session.
- (RACSignal *)signupWithEmail:(NSString *)email password:(NSString *)password {
    return [[RACSignal return:[[Session alloc] initWithEmail:self.email]] delay:0.5];
}

@end
