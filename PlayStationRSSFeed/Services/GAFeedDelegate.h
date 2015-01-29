//
//  GAFeedDelegate.h
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GAFeedDelegate <NSObject>

@required
- (void)showFeeds:(NSArray *)feeds;

@end
