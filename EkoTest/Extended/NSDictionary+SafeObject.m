//
//  NSDictionary+SafeObject.m
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import <Foundation/Foundation.h>

@implementation NSDictionary (SafeObject)

- (nullable id)safeObjectForKey:(nonnull NSString *)key {
    id result = [self objectForKey:key];
    if ([result isEqual:[NSNull null]]) {
        return nil;
    }
    return result;
}

@end

