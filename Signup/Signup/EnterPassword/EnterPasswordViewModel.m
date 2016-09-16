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

@implementation EnterPasswordViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        

        RACSignal *passwordValid = [RACObserve(self, password)
            map:^id(NSString *name) {
                return @(name.length > 4);
            }];
        
        @weakify(self)
        _signUpCommand = [[RACCommand alloc] initWithEnabled:passwordValid signalBlock:^RACSignal *(id input) {
            @strongify(self)
            return [RACSignal return:self.password];
        }];

    }
    return self;
}

@end
