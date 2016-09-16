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

// Sends a verified email when the done button is tapped.
@property (nonatomic, readonly) RACCommand *doneButtonCommand;

@end
