//
//  GARSSTableViewDataSource.m
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import "GARSSTableViewDataSource.h"
#import "GARSSTableViewCell.h"
#import "GAFeed.h"

@implementation GARSSTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GARSSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RSS-Cell"];
    
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"GARSSTableViewCell" bundle:nil] forCellReuseIdentifier:@"RSS-Cell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"RSS-Cell"];
    }
    GAFeed *feed = self.items[indexPath.row];
    cell.titleLabel.text = feed.title;
    cell.descriptionLabel.text = feed.feedContent;
    
    return cell;
}

@end
