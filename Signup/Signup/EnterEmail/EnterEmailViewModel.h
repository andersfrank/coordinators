//
//  EnterEmailViewModel.h
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACCommand;

@interface EnterEmailViewModel : NSObject

@property (nonatomic) NSString *email;

// Executed when the user taps the done button. Successful execution implies that the entered email is verified.
@property (nonatomic, readonly) RACCommand *doneButtonCommand;

@end
