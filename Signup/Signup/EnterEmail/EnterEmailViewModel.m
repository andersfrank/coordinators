//
//  EnterEmailViewModel.m
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import "EnterEmailViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation EnterEmailViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        
        RACSignal *emailValid = [RACObserve(self, email)
            map:^id(NSString *email) {
                return @(email.length > 5);
            }];
        
        @weakify(self)
        _doneButtonCommand = [[RACCommand alloc] initWithEnabled:emailValid signalBlock:^RACSignal *(id input) {
            @strongify(self)
            return [RACSignal return:self.email];
        }];

    }
    return self;
}

@end
