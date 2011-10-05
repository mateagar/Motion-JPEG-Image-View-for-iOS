//
//  MotionJpegImageView.h
//  VideoTest
//
//  Created by Matthew Eagar on 10/3/11.
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

#import <UIKit/UIKit.h>

@interface MotionJpegImageView : UIImageView {
    
@private
    NSURL *_url;
    NSURLConnection *_connection;
    NSMutableData *_receivedData;
    NSString *_username;
    NSString *_password;
    BOOL _allowSelfSignedCertificates;
    BOOL _allowClearTextCredentials;
    
}

@property (nonatomic, readwrite, copy) NSURL *url;
@property (readonly) BOOL isPlaying;
@property (nonatomic, readwrite, copy) NSString *username;
@property (nonatomic, readwrite, copy) NSString *password;
@property (nonatomic, readwrite, assign) BOOL allowSelfSignedCertificates;
@property (nonatomic, readwrite, assign) BOOL allowClearTextCredentials;

- (void)play;
- (void)pause;
- (void)clear;
- (void)stop;

@end
