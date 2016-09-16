//
//  SessionManager.h
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Session.h"

@interface SessionManager : NSObject

+ (instancetype)sharedManager;

@property (nonatomic, strong) Session *session;

@end
