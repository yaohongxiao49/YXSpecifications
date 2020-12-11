//
//  YXMallSpecificationsAlertFooterView.m
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import "YXMallSpecificationsAlertFooterView.h"

@implementation YXMallSpecificationsAlertFooterView

#pragma mark - 加入购物车
- (IBAction)progressJoinBtn:(UIButton *)sender {
    
    [self.alertController dismissViewControllerAnimated:YES];
}

#pragma mark - 立即购买
- (IBAction)progressBuyIngBtn:(UIButton *)sender {
    
    [self.alertController dismissViewControllerAnimated:YES];
}

#pragma mark - setting
- (void)setAlertController:(TYAlertController *)alertController {
    
    _alertController = alertController;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    [RLSign getSpecifiedFillet:self.joinBtn corners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(19, 19)];
//    [RLSign getSpecifiedFillet:self.buyIngBtn corners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(19, 19)];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    [RLSign getSpecifiedFillet:self.joinBtn corners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(19, 19)];
//    [RLSign getSpecifiedFillet:self.buyIngBtn corners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(19, 19)];
}

@end
