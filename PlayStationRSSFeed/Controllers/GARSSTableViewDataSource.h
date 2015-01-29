//
//  GARSSTableViewDataSource.h
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GAFeedDelegate.h"

@interface GARSSTableViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) id<GAFeedDelegate> delegate;

@end
