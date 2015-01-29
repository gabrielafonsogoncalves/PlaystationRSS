//
//  GAWebViewController.h
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GAWebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *url;

- (IBAction)back:(id)sender;

@end
