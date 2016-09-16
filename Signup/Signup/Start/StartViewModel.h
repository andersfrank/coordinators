//
//  StartViewModel.h
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StartViewModel : NSObject

@property (nonatomic, assign) BOOL visible;

@property (nonatomic, readonly) BOOL signUpButtonVisible;
@property (nonatomic, readonly) BOOL signedUpLabelVisible;
@property (nonatomic, readonly) NSString *signedUpLabelText;


@end
