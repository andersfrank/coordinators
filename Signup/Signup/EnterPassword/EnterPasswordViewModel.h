//
//  EnterNameViewModel.h
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACCommand;

@interface EnterPasswordViewModel : NSObject

@property (nonatomic) NSString *password;

// Will send a verified password when the sign up button is tapped.
@property (nonatomic, readonly) RACCommand *signUpCommand;

@end
