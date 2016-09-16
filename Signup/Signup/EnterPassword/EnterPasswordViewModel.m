//
//  EnterNameViewModel.m
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import "EnterPasswordViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "Session.h"
#import "SessionManager.h"

@interface EnterPasswordViewModel ()

@property (nonatomic, strong) NSString *email;

@end

@implementation EnterPasswordViewModel

- (instancetype)initWithEmail:(NSString *)email {
    self = [super init];
    if (self) {
        
        _email = email;
        
        RACSignal *passwordValid = [RACObserve(self, password)
            map:^id(NSString *name) {
                return @(name.length > 4);
            }];
        
        @weakify(self)
        _signUpCommand = [[RACCommand alloc] initWithEnabled:passwordValid signalBlock:^RACSignal *(id input) {
            @strongify(self)
            return [self signupWithEmail:self.email password:self.password];
        }];

    }
    return self;
}

- (RACSignal *)signupWithEmail:(NSString *)email password:(NSString *)password {
    Session *session = [[Session alloc] initWithEmail:self.email];
    [SessionManager sharedManager].session = session;
    return [[RACSignal return:session] delay:2];
}


@end
