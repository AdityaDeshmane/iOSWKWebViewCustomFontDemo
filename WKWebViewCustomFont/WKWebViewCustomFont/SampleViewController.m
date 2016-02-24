//
//  ViewController.m
//  WKWebViewCustomFont
//
//  Created by Aditya Deshmane on 25/02/16.


//    The MIT License (MIT)
//
//    Copyright (c) 2016 Aditya Deshmane
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.



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
