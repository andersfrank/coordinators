//
//  StartViewModel.m
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import "StartViewModel.h"
#import "SessionManager.h"
#import "Session.h"

@interface StartViewModel ()

@property (nonatomic) BOOL signUpButtonVisible;
@property (nonatomic) BOOL signedUpLabelVisible;
@property (nonatomic) NSString *signedUpLabelText;

@end

@implementation StartViewModel

- (void)setVisible:(BOOL)visible {
    _visible = visible;
    
    SessionManager *sessionManager = [SessionManager sharedManager];
    if (sessionManager.session) {
        self.signedUpLabelText = [NSString stringWithFormat:@"Signed in with email:\n%@", sessionManager.session.email];
        self.signedUpLabelVisible = YES;
        self.signUpButtonVisible = NO;
    } else {
        self.signedUpLabelVisible = NO;
        self.signUpButtonVisible = YES;
    }
    
}

@end
