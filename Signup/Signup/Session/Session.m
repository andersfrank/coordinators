//
//  Session.m
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import "Session.h"

@implementation Session

- (instancetype)initWithEmail:(NSString *)email {
    self = [super init];
    if (self) {
        _email = email;
        _token = [[NSUUID UUID] UUIDString];
    }
    return self;
}

@end
