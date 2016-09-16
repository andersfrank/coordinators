//
//  ViewController.m
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import "StartViewController.h"
#import "StartViewModel.h"
#import "EnterEmailViewModel.h"
#import "EnterEmailViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface StartViewController ()

@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UILabel *signedUpLabel;

@end

@implementation StartViewController

- (IBAction)signUpButtonTapped:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EnterEmailViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(EnterEmailViewController.class)];
    vc.viewModel = [EnterEmailViewModel new];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RAC(self.signUpButton, hidden) = [RACObserve(self, viewModel.signUpButtonVisible) not];
    RAC(self.signedUpLabel, hidden) = [RACObserve(self, viewModel.signedUpLabelVisible) not];
    RAC(self.signedUpLabel, text) = RACObserve(self, viewModel.signedUpLabelText);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.viewModel.visible = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.viewModel.visible = NO;
}

@end
