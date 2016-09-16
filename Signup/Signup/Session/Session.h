//
//  Session.h
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Session : NSObject

@property (nonatomic, readonly) NSString *token;
@property (nonatomic, readonly) NSString *email;

- (instancetype)initWithEmail:(NSString *)email;

@end
