//
//  StartViewModel.m
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import "StartViewModel.h"
#import "Session.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface StartViewModel ()

@property (nonatomic) BOOL signUpButtonVisible;
@property (nonatomic) BOOL signedUpLabelVisible;
@property (nonatomic) NSString *signedUpLabelText;

@end

@implementation StartViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _signUpButtonCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            return [RACSignal empty];
        }];
        
        RAC(self, signedUpLabelText) = [RACObserve(self, session) map:^id(Session *session) {
            return [NSString stringWithFormat:@"Signed in with email:\n%@", session.email];
        }];
        RAC(self, signedUpLabelVisible) = [RACObserve(self, session) map:^id(Session *session) {
            return @(session != nil);
        }];
        RAC(self, signUpButtonVisible) = [RACObserve(self, signedUpLabelVisible) not];
    }
    return self;
}

@end
