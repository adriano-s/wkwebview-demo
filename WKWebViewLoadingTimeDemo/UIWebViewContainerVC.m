//
//  UIWebViewContainerVC.m
//  WKWebViewLoadingTimeDemo
//
//  Created by Adriano Segalada on 07.10.19.
//  Copyright © 2019 Adriano Segalada. All rights reserved.
//

#import "UIWebViewContainerVC.h"

@interface UIWebViewContainerVC () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic) NSDate *startLoading;

@end

@implementation UIWebViewContainerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.delegate = self;
    self.startLoading = [NSDate date];
    [self.webView loadHTMLString:@"<html><body>Some trivial html that should be visible in nearly no time.</body></html>" baseURL:[[NSBundle mainBundle] bundleURL]];
}


#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"Start Loading");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"Loading time UIWebView: %f", [[NSDate date] timeIntervalSinceDate:self.startLoading]);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
