//
//  GAMainViewController.h
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAFeedDelegate.h"

@interface GAMainViewController : UIViewController <GAFeedDelegate>

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
