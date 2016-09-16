//
//  EnterEmailViewController.m
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import "EnterEmailViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "EnterEmailViewModel.h"

#import "EnterPasswordViewController.h"
#import "EnterPasswordViewModel.h"

@interface EnterEmailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation EnterEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RAC(self, viewModel.email) = self.textField.rac_textSignal;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:nil action:NULL];
    self.navigationItem.rightBarButtonItem.rac_command = self.viewModel.doneButtonCommand;
    
    
    @weakify(self)
    [self.viewModel.doneButtonCommand.executionSignals subscribeNext:^(id x) {
        @strongify(self)
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        EnterPasswordViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(EnterPasswordViewController.class)];
        vc.viewModel = [[EnterPasswordViewModel alloc] initWithEmail:self.viewModel.email];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
}


@end
