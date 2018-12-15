//
//  UserDetailViewController.m
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import "UserDetailViewController.h"
#import "UserDetailViewModel.h"
#import "WebKit/WebKit.h"

@interface UserDetailViewController () <UserDetailViewModel, WKNavigationDelegate>
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (strong, nonatomic) UserDetailViewModel *viewModel;
@end

@implementation UserDetailViewController

- (instancetype)initWithViewModel:(UserDetailViewModel *)viewModel {
    self = [super initWithNibName:NSStringFromClass([UserDetailViewController class]) bundle:nil];
    
    if (self) {
        self.viewModel = viewModel;
        self.viewModel.action = self;
    }
    
    return self;
}
    

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.navigationDelegate = self;
    
    [self.viewModel onLoad];
}

#pragma mark - UserDetailViewModelAction
- (void)configureWebViewWithURL:(NSURL *)url {
    [self showLoadingView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self hideLoadingView];
}

@end
