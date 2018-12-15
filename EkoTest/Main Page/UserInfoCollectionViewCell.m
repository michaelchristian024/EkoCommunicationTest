//
//  UserInfoCollectionViewCell.m
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import "UserInfoCollectionViewCell.h"
#import "UserModel.h"
#import "UIImageView+AFNetworking.h"

@interface UserInfoCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *loginLabel;
@property (strong, nonatomic) IBOutlet UILabel *githublabel;
@property (strong, nonatomic) IBOutlet UILabel *accountTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *siteAdminLabel;
@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (strong, nonatomic) IBOutlet UIImageView *favouriteIconImageView;
@property (strong, nonatomic) NSString *userId;
@end

@implementation UserInfoCollectionViewCell

- (void)configureCellWithUserModel:(UserModel *)user {
    [self.avatarImageView setImageWithURL:[NSURL URLWithString:user.avatarUrl]];
    self.loginLabel.text = user.login;
    self.githublabel.text = user.githubUrl;
    self.accountTypeLabel.text = user.accountType;
    self.siteAdminLabel.text = user.siteAdmin ? @"true" : @"false";
    
    self.userId = user.userId.stringValue;
    if ([[NSUserDefaults standardUserDefaults] objectForKey:self.userId]) {
        [self.favouriteIconImageView setImage:[UIImage imageNamed:@"ic-fav"]];
    }
    else {
        [self.favouriteIconImageView setImage:[UIImage imageNamed:@"ic-unfav"]];
    }
    
    [self addGestureRecognizerFor:self.favouriteIconImageView action:@selector(favouriteIconDidTapped:)];
    
}

- (void)addGestureRecognizerFor:(UIView *)view action:(SEL)action {
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    [view addGestureRecognizer:tapRecognizer];
    view.userInteractionEnabled = YES;
}

- (void)favouriteIconDidTapped:(id)sender {
    if ([[NSUserDefaults standardUserDefaults] objectForKey:self.userId]) {
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:self.userId];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self.favouriteIconImageView setImage:[UIImage imageNamed:@"ic-unfav"]];
    }
    else {
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:self.userId];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self.favouriteIconImageView setImage:[UIImage imageNamed:@"ic-fav"]];
    }
}

@end
