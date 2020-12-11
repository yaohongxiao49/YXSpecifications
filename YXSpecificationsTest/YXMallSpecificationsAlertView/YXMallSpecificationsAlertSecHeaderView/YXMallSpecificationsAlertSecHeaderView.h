//
//  YXMallSpecificationsAlertSecHeaderView.h
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import <UIKit/UIKit.h>
#import "YXMallSpecificationsModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YXMallSpecificationsAlertSecHVType) {
    /** 其他正常显示 */
    YXMallSpecificationsAlertSecHVTypeNormal,
    /** 数量选择 */
    YXMallSpecificationsAlertSecHVTypeNum,
};

@interface YXMallSpecificationsAlertSecHeaderView : UIView

/** 标题 */
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
/** 数量背景视图 */
@property (weak, nonatomic) IBOutlet UIView *numBgView;
/** 加号按钮 */
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
/** 减号按钮 */
@property (weak, nonatomic) IBOutlet UIButton *reduceBtn;
/** 数量显示输入框 */
@property (weak, nonatomic) IBOutlet UITextField *numTextField;

- (void)reloadValueByIndex:(NSInteger)index model:(YXMallSpecificationsModel *)model type:(YXMallSpecificationsAlertSecHVType)type;

@end

NS_ASSUME_NONNULL_END
