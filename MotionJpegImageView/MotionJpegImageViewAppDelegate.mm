//
//  MotionJpegImageViewAppDelegate.m
//  MotionJpegImageView
//
//  Created by Matthew Eagar on 10/4/11.
//  Copyright 2011 ThinkFlood Inc. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is furnished
// to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "MotionJpegImageViewAppDelegate.h"

@implementation MotionJpegImageViewAppDelegate

@synthesize window = _window;

-           (BOOL)application:(UIApplication *)application 
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Demonstrates the dramatic performance difference between loading M-JPEGs 
    // through UIWebView (top) vs MotionJpegImageView (bottom)
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, 640.0, 480.0)];
    _webView.userInteractionEnabled = NO;
    CGFloat scaleRatio = self.window.bounds.size.width / _webView.bounds.size.width;
    CGAffineTransform scalingTransform = 
        CGAffineTransformScale(CGAffineTransformIdentity, scaleRatio, scaleRatio);
    [_webView setTransform:scalingTransform];
    CGRect webFrame = _webView.frame;
    webFrame.origin.y = 0.0;
    webFrame.origin.x = 0.0;
    _webView.frame = webFrame;
    
    NSURL *url = [NSURL URLWithString:@"http://webcam6.med.miami.edu/mjpg/video.mjpg"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [self.window addSubview:_webView];
    
    webFrame.origin.y += webFrame.size.height;
    _imageView = [[MotionJpegImageView alloc] initWithFrame:webFrame];
    _imageView.url = url;
    [self.window addSubview:_imageView];
    [_imageView play];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [_webView stopLoading];
    [_imageView pause];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [_webView reload];
    [_imageView play];
}

- (void)dealloc {
    [_window release];
    [_webView release];
    [_imageView release];
    
    [super dealloc];
}

@end
