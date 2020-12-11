//
//  YXMallSpecificationsAlertView.h
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXMallSpecificationsAlertView : UIView

@property (nonatomic, weak) TYAlertController *alertController;

- (instancetype)initWithFrame:(CGRect)frame boolMsgStay:(BOOL)boolMsgStay boolBottomStay:(BOOL)boolBottomStay;

@end

NS_ASSUME_NONNULL_END
