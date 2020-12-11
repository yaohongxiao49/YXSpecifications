//
//  YXMallSpecificationsAlertSecHeaderView.m
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import "YXMallSpecificationsAlertSecHeaderView.h"

@interface YXMallSpecificationsAlertSecHeaderView () <UITextFieldDelegate>

@property (nonatomic, copy) YXMallSpecificationsModel *model;
@property (nonatomic, copy) YXMallSpecificationsMsgModel *msgModel;

@end

@implementation YXMallSpecificationsAlertSecHeaderView

#pragma mark - method
- (void)reloadValueByIndex:(NSInteger)index model:(YXMallSpecificationsModel *)model type:(YXMallSpecificationsAlertSecHVType)type {
    
    _model = model;
    _msgModel = _model.goodsSpecificationMsgArr[index];
    
    self.titleLab.text = _msgModel.goodSpecificationsFatherTitle;
    self.numBgView.hidden = YES;
    if (type == YXMallSpecificationsAlertSecHVTypeNum) {
        self.numBgView.hidden = NO;
        [self judgeAddAndReduceBtnShowByModel:_model];
    }
}

#pragma mark - 判定加减按钮显示
- (void)judgeAddAndReduceBtnShowByModel:(YXMallSpecificationsModel *)model {
    
    self.numTextField.text = [NSString stringWithFormat:@"%ld", model.goodsCurrentNum];
    
    self.addBtn.userInteractionEnabled = self.reduceBtn.userInteractionEnabled = YES;
    [self.addBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    [self.reduceBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    
    if (model.goodsCurrentNum >= model.goodsMaxNum) { //最大
        self.addBtn.userInteractionEnabled = NO;
        [self.addBtn setTitleColor:[UIColor colorWithHexString:@"#B2B2B2"] forState:UIControlStateNormal];
    }
    else if (model.goodsCurrentNum <= model.goodsMinNum) { //最小
        self.reduceBtn.userInteractionEnabled = NO;
        [self.reduceBtn setTitleColor:[UIColor colorWithHexString:@"#B2B2B2"] forState:UIControlStateNormal];
    }
}

#pragma mark - setting
- (void)setModel:(YXMallSpecificationsModel *)model {
    
    _model = model;
    
    [self judgeAddAndReduceBtnShowByModel:_model];
}

#pragma mark - progress
#pragma mark - 加号按钮点击事件
- (IBAction)progressAddBtn:(UIButton *)sender {
    
    if (_model.goodsCurrentNum < _model.goodsMaxNum) {
        _model.goodsCurrentNum++;
    }
    
    [self judgeAddAndReduceBtnShowByModel:_model];
    [[NSNotificationCenter defaultCenter] postNotificationName:kYXMallSpecificationsReloadValueNoti object:nil];
}

#pragma mark - 减号按钮点击事件
- (IBAction)progressReduceBtn:(UIButton *)sender {
    
    if (_model.goodsCurrentNum > _model.goodsMinNum) {
        _model.goodsCurrentNum--;
    }
    
    [self judgeAddAndReduceBtnShowByModel:_model];
    [[NSNotificationCenter defaultCenter] postNotificationName:kYXMallSpecificationsReloadValueNoti object:nil];
}

#pragma mark - <UITextFieldDelegate>
- (void)textFieldChanged:(UITextField *)textField {
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    [self textFieldChanged:textField];
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    [self textFieldChanged:textField];
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    return YES;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.numTextField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    self.numTextField.delegate = self;
    self.numTextField.enabled = NO;
}


@end
