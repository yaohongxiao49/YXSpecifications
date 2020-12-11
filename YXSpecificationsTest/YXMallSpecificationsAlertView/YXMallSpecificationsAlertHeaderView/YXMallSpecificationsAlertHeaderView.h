//
//  YXMallSpecificationsAlertHeaderView.h
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import <UIKit/UIKit.h>
#import "YXMallSpecificationsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXMallSpecificationsAlertHeaderView : UIView

/** 商品图片 */
@property (weak, nonatomic) IBOutlet UIImageView *goodsImgV;
/** 商品价格 */
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLab;
/** 商品规格 */
@property (weak, nonatomic) IBOutlet UILabel *goodsSpecificationNumLab;
/** 关闭按钮 */
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@property (nonatomic, weak) TYAlertController *alertController;
@property (nonatomic, copy) YXMallSpecificationsModel *model;

@end

NS_ASSUME_NONNULL_END
