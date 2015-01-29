//
//  GAFeedService.h
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GAFeedDelegate.h"

@interface GAFeedService : NSObject

@property (strong, nonatomic) id<GAFeedDelegate> delegate;

- (void)fetchPlaystationFeeds;

@end
