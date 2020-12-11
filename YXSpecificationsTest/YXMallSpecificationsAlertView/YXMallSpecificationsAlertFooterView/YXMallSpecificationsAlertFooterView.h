//
//  YXMallSpecificationsAlertFooterView.h
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import <UIKit/UIKit.h>
#import "YXMallSpecificationsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXMallSpecificationsAlertFooterView : UIView

@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UIView *joinBgView;
@property (weak, nonatomic) IBOutlet UIButton *joinBtn;

@property (weak, nonatomic) IBOutlet UIView *buyIngBgView;
@property (weak, nonatomic) IBOutlet UIButton *buyIngBtn;

@property (nonatomic, weak) TYAlertController *alertController;

@end

NS_ASSUME_NONNULL_END
