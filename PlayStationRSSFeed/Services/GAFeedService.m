//
//  GAFeedService.m
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import "GAFeedService.h"
#import "GDataXMLNode.h"
#import "GAFeed.h"
#import "GAQueueService.h"

@implementation GAFeedService

- (void)fetchPlaystationFeeds
{
    dispatch_queue_t queue = [GAQueueService queue:@"load.playstation.feeds"];
    dispatch_async(queue, ^{
        
        NSData *xmlData = [[NSMutableData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://webassets.scea.com/pscomauth/groups/public/documents/webasset/rss/playstation/Games_PS3.rss"]];
        
        NSError *error;
        GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData error:&error];
        if (doc == nil) {
            return;
        }
        
        NSMutableArray *feeds = [NSMutableArray array];
        NSArray *channels = [doc.rootElement elementsForName:@"channel"];
        
        for (GDataXMLElement *element in channels) {
            NSArray *items = [element elementsForName:@"item"];
            for (GDataXMLElement *itemElement in items) {
                NSArray *names = [itemElement elementsForName:@"title"];
                NSArray *descriptions = [itemElement elementsForName:@"description"];
                GDataXMLElement *name = names.firstObject;
                GDataXMLElement *description = descriptions.firstObject;
                GAFeed *feed = [[GAFeed alloc] init];
                feed.title = name.stringValue;
                feed.feedContent = description.stringValue;
                [feeds addObject:feed];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.delegate) {
                [self.delegate showFeeds:feeds];
            }
        });
    });
}

@end
