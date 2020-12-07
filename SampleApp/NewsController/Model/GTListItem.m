//
//  GTListItem.m
//  SampleApp
//
//  Created by 王韬 on 2020/11/16.
//

#import "GTListItem.h"

@implementation GTListItem

#pragma mark - NSSecureCoding

- (void)encodeWithCoder:(nonnull NSCoder *)acoder {
    [acoder encodeObject:self.category forKey:@"category"];
    [acoder encodeObject:self.picUrl forKey:@"picUrl"];
    [acoder encodeObject:self.uniqueKey forKey:@"uniqueKey"];
    [acoder encodeObject:self.title forKey:@"title"];
    [acoder encodeObject:self.date forKey:@"date"];
    [acoder encodeObject:self.authorName forKey:@"authorName"];
    [acoder encodeObject:self.articleUrl forKey:@"articleUrl"];
    
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super self];
    if (self) {
        self.category = [aDecoder decodeObjectForKey:@"category"];
        self.picUrl = [aDecoder decodeObjectForKey:@"picUrl"];
        self.uniqueKey = [aDecoder decodeObjectForKey:@"uniqueKey"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.authorName = [aDecoder decodeObjectForKey:@"authorName"];
        self.articleUrl = [aDecoder decodeObjectForKey:@"articleUrl"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}

#pragma mark - public method

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
