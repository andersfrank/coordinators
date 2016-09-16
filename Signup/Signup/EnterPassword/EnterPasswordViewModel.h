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

- (instancetype)initWithEmail:(NSString *)email;

@property (nonatomic) NSString *password;

// The execution signal will send a Session when the user has succesfully signed up.
@property (nonatomic, readonly) RACCommand *signUpCommand;

@end
