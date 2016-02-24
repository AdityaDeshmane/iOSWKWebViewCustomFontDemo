//
//  ViewController.m
//  WKWebViewCustomFont
//
//  Created by Aditya Deshmane on 25/02/16.
//  Copyright © 2016 Aditya Deshmane. All rights reserved.
//

#import "SampleViewController.h"
#import <WebKit/WebKit.h>

@interface SampleViewController ()

@property(nonatomic) WKWebView   *wkWebView;

@end

@implementation SampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupWKWebView];
    [self loadHtmlStringToWKWebView];
}

-(void)setupWKWebView
{
    //1. Create WKWebView instance
    _wkWebView = [WKWebView new];
    
    //2. Add WKWebView as subview with 0 margins left, right, bottom and 20 from top
    UIView *containerWebVIew = self.view;
    UIView *subview = _wkWebView;
    _wkWebView.translatesAutoresizingMaskIntoConstraints = NO;
    [containerWebVIew addSubview:_wkWebView];
    
    [containerWebVIew addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[subview]-0-|"
                                                                              options:0
                                                                              metrics:nil
                                                                                views:NSDictionaryOfVariableBindings(subview)]];
    
    [containerWebVIew addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[subview]-0-|"
                                                                              options:0
                                                                              metrics:nil
                                                                                views:NSDictionaryOfVariableBindings(subview)]];
}

-(void)loadHtmlStringToWKWebView
{
    NSString *strCssHead = [NSString stringWithFormat:@"<head>"
                            "<link rel=\"stylesheet\" type=\"text/css\" href=\"iPhone.css\">"
                            "</head>"];
    NSString *strBody    = [NSString stringWithFormat:@"<body>"
                            "<h1>Font 1</h1>"
                            "<h2>Font 2</h2>"
                            "<h3>Font 3</h3>"
                            @"</body>"];
    
    [_wkWebView loadHTMLString:[NSString stringWithFormat:@"%@%@",strCssHead,strBody]
                       baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"iPhone" ofType:@"css"]]];
}

@end
