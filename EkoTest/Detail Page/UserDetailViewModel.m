//
//  UserDetailViewModel.m
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import "UserDetailViewModel.h"
#import "UserModel.h"

@interface UserDetailViewModel ()
@property (strong, nonatomic, readwrite) UserModel *user;
@end

@implementation UserDetailViewModel

- (instancetype)initWithUserModel:(UserModel *)user {
    self = [super init];
    
    if (self) {
        self.user = user;
    }
    
    return self;
}

- (void)onLoad {
    [self.action configureWebViewWithURL:[NSURL URLWithString:self.user.githubUrl]];
}
@end
