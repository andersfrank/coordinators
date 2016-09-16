//
//  SignUpCoordinator.h
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;

@interface SignUpCoordinator : NSObject

// Sends a Session when the user has signed up.
@property (nonatomic) RACSignal *didSignUp;

- (instancetype)initWithViewController:(UIViewController *)viewController;

- (void)start;

@end
