//
//  GAMainViewController.m
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import "GAMainViewController.h"
#import "GARSSTableViewDataSource.h"
#import "GAWebViewController.h"
#import "GAFeedService.h"
#import "GAFeed.h"

@interface GAMainViewController ()

@property (strong, nonatomic) GARSSTableViewDataSource *dataSource;

@end

@implementation GAMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[GARSSTableViewDataSource alloc ] init];
    self.dataSource.delegate = self;
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self loadRSSFeeds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadRSSFeeds {
    [self.activityIndicator startAnimating];
    GAFeedService *feedService = [[GAFeedService alloc] init];
    feedService.delegate = self;
    [feedService fetchPlaystationFeeds];
}

#pragma mark GAFeedDelegate

- (void)showFeeds:(NSArray *)feeds {
    self.dataSource.items = feeds;
    [self.tableView reloadData];
    [self.activityIndicator stopAnimating];
}

- (void)openUrlRequest:(NSString *)url
{
    GAWebViewController *webViewController = [[GAWebViewController alloc] initWithNibName:@"GAWebViewController" bundle:nil];
    webViewController.url = url;
    [self presentViewController:webViewController animated:YES completion:nil];
}

@end
