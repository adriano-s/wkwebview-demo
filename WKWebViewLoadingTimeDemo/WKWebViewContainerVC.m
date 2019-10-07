//
//  WKWebViewContainerVC.m
//  WKWebViewLoadingTimeDemo
//
//  Created by Adriano Segalada on 07.10.19.
//  Copyright © 2019 Adriano Segalada. All rights reserved.
//

#import "WKWebViewContainerVC.h"
@import WebKit;

@interface WKWebViewContainerVC () <WKNavigationDelegate>
@property (weak, nonatomic) IBOutlet WKWebView *wkWebView;
@property (nonatomic) NSDate *startLoading;

@end

@implementation WKWebViewContainerVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.wkWebView.navigationDelegate = self;
    self.startLoading = [NSDate date];
    [self.wkWebView loadHTMLString:@"<html><body>Some trivial html that should be visible in nearly no time.</body></html>" baseURL:[[NSBundle mainBundle] bundleURL]];
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"Loading time WKWebView: %f", [[NSDate date] timeIntervalSinceDate:self.startLoading]);
}

@end
