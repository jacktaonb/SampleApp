//
//  GTNormalTableViewCell.h
//  SampleApp
//
//  Created by 王韬 on 2020/11/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GTListItem;

//删除按钮
@protocol GTNormalTableViewCellDelgate <NSObject>

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

//新闻列表cell
@interface GTNormalTableViewCell : UITableViewCell

@property(nonatomic,weak,readwrite) id<GTNormalTableViewCellDelgate> delegate;

-(void)layoutTableViewCellWithItem:(GTListItem *)item;

@end

NS_ASSUME_NONNULL_END
