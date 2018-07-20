//
//  WebDebuggerTestViewController.m
//
//  Created by xiaogang zhang on 2017/12/17.
//  Copyright © 2017年 lifebetter. All rights reserved.
//

#import "WebContentViewController.h"

@import WebKit;
@import UIKit;

@interface WebContentViewController ()<WKUIDelegate>

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
        wkWebView.UIDelegate = self;
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

#pragma mark -----------------   wkwebview uidelegate (Alert,Confirm support)  ----------------

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    if(message.length == 0) return;
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Alert" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * confirm = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }];
    [alert addAction:confirm];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler
{
    if(message.length == 0) return;
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Alert" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }];
    UIAlertAction * confirm = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }];
    [alert addAction:cancel];
    [alert addAction:confirm];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

























