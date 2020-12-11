//
//  YXMallSpecificationsAlertCell.h
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import <UIKit/UIKit.h>
#import "YXMallSpecificationAlertCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXMallSpecificationsAlertCellFlowLayout : UICollectionViewFlowLayout

@end

@interface YXMallSpecificationsAlertCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
/** collectionView高度 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewConstraintHeight;

- (void)reloadValueByIndexPath:(NSIndexPath *)indexPath model:(YXMallSpecificationsModel *)model;

@end

NS_ASSUME_NONNULL_END
