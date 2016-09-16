//
//  StartViewModel.h
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACCommand, Session;

@interface StartViewModel : NSObject

@property (nonatomic) Session *session;

@property (nonatomic, assign) BOOL visible;

// Will be triggered when user taps sign up button.
@property (nonatomic, readonly) RACCommand *signUpButtonCommand;

@property (nonatomic, readonly) BOOL signUpButtonVisible;
@property (nonatomic, readonly) BOOL signedUpLabelVisible;
@property (nonatomic, readonly) NSString *signedUpLabelText;


@end
