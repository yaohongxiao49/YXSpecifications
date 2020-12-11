//
//  YXMallSpecificationAlertCollectionViewCell.h
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import <UIKit/UIKit.h>
#import "YXMallSpecificationsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXMallSpecificationAlertCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIButton *titleBtn;

- (void)reloadValueByIndexPath:(NSIndexPath *)indexPath arr:(NSArray *)arr model:(YXMallSpecificationsModel *)model;

@end

NS_ASSUME_NONNULL_END
