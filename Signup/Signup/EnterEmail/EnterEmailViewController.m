//
//  EnterEmailViewController.m
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "EnterEmailViewController.h"
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
}


@end
