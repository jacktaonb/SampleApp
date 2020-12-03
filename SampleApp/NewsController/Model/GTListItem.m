//
//  GTListItem.m
//  SampleApp
//
//  Created by 王韬 on 2020/11/16.
//

#import "GTListItem.h"

@implementation GTListItem

- (void)configWithDictionary:(NSDictionary *)dictionary {
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniqueKey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
}

@end
