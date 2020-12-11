//
//  YXMallSpecificationsAlertHeaderView.m
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import "YXMallSpecificationsAlertHeaderView.h"

@implementation YXMallSpecificationsAlertHeaderView

#pragma mark - progress
#pragma mark - 关闭
- (IBAction)progressCloseBtn:(UIButton *)sender {
    
    [self.alertController dismissViewControllerAnimated:YES];
}

#pragma mark - setting
- (void)setModel:(YXMallSpecificationsModel *)model {
    
    _model = model;
    
    [self.goodsImgV setImage:[UIImage imageNamed:_model.goodsImgUrl]];
    self.goodsPriceLab.text = [NSString stringWithFormat:@"¥ %@", _model.goodsPrice];
    self.goodsSpecificationNumLab.text = [NSString stringWithFormat:@"规格编号：%@", _model.goodsSpecificationNum];
}
- (void)setAlertController:(TYAlertController *)alertController {
    
    _alertController = alertController;
}

@end
