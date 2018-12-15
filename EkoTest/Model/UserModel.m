//
//  UserModel.m
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import "UserModel.h"
#import "NSDictionary+SafeObject.h"

NSString *const kUserModelLogin = @"login";
NSString *const kUserModelAvatarUrl = @"avatar_url";
NSString *const kUserModelGithubUrl = @"html_url";
NSString *const kUserModelAccountType = @"type";
NSString *const kUserModelAccountSiteAdmin = @"site_admin";
NSString *const kUserModelAccountId = @"id";

@implementation UserModel

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype) initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.login = [dict safeObjectForKey:kUserModelLogin];
        self.avatarUrl = [dict safeObjectForKey:kUserModelAvatarUrl];
        self.githubUrl = [dict safeObjectForKey:kUserModelGithubUrl];
        self.accountType = [dict safeObjectForKey:kUserModelAccountType];
        self.siteAdmin = [dict safeObjectForKey:kUserModelAccountSiteAdmin];
        self.userId = [dict safeObjectForKey:kUserModelAccountId];
    }
    return self;
}
@end
