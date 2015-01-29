//
//  GAWebViewController.m
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import "GAWebViewController.h"

@interface GAWebViewController ()

@end

@implementation GAWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
