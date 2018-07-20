//
//  NetworkViewController.m
//  WoodPeckerDemo
//
//  Created by xiaogang zhang on 2018/1/17.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

#import "NetworkViewController.h"

@interface NetworkViewController ()<NSURLConnectionDataDelegate, NSURLSessionDataDelegate>

@end

@implementation NetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)startRequest:(id)sender {
    //url connection
    NSURL * requestURL = [NSURL URLWithString:@"https://api.github.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:requestURL];
    NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    
    //url session
    [self sessionRequest];
}

- (void)sessionRequest
{
    // NSURLSession
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 10.0;
    NSURLSession *mySession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSString * url = @"https://api.github.com/emojis";
    NSURL * requestURL = [NSURL URLWithString:url];
    NSMutableURLRequest * uploadRequest = [NSMutableURLRequest requestWithURL:requestURL];
    uploadRequest.HTTPMethod = @"POST";
    NSString * formText = [NSString stringWithFormat:@"q=%.f",[[NSDate date] timeIntervalSince1970]];
    NSData * data = [formText dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionTask * task = [mySession uploadTaskWithRequest:uploadRequest fromData:data completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
    }];
    [task resume];
}

- (nullable NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(nullable NSURLResponse *)response
{
    return request;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
}

- (void)connection:(NSURLConnection *)connection
   didSendBodyData:(NSInteger)bytesWritten
 totalBytesWritten:(NSInteger)totalBytesWritten
totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite
{
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
