//
//  WebDebuggerTestViewController.m
//
//  Created by 张小刚 on 2017/12/17.
//  Copyright © 2017年 lifebetter. All rights reserved.
//

#import "WebContentViewController.h"

@import WebKit;
@import UIKit;

@interface WebContentViewController ()

@property (nonatomic, strong) UIWebView * webView;
@property (nonatomic, strong) WKWebView * wkWebView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation WebContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.uiwebView ? @"UIWebView" : @"WKWebView";
    [self setupWebview];
    [self loadContent];
}

- (void)setupWebview
{
    UIView * contentView = self.contentView;
    if(self.uiwebView){
        UIWebView * webView = [[UIWebView alloc] init];
        webView.frame = contentView.bounds;
        webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [contentView addSubview:webView];
        self.webView = webView;
    }else{
        WKWebView * wkWebView = [[WKWebView alloc] init];
        wkWebView.frame = contentView.bounds;
        wkWebView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [contentView addSubview:wkWebView];
        self.wkWebView = wkWebView;
    }
}

- (void)loadContent
{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    NSString * url = @"http://www.woodpeck.cn";
    NSURL * requestURL = [NSURL URLWithString:url];
    NSURLRequest * request = [NSURLRequest requestWithURL:requestURL];
    if(self.uiwebView){
        [self.webView loadRequest:request];
    }else{
        [self.wkWebView loadRequest:request];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

























