//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "EnterPasswordViewController.h"
#import "EnterPasswordViewModel.h"
#import "Session.h"

@interface EnterPasswordViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation EnterPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RAC(self, viewModel.password) = self.textField.rac_textSignal;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:nil action:NULL];
    self.navigationItem.rightBarButtonItem.rac_command = self.viewModel.signUpCommand;
    
    @weakify(self)
    [self.viewModel.signUpCommand.executionSignals.flatten subscribeNext:^(Session *session) {
        @strongify(self)
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
}


@end
