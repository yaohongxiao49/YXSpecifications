//
//  YXMallSpecificationAlertCollectionViewCell.m
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import "YXMallSpecificationAlertCollectionViewCell.h"

@implementation YXMallSpecificationAlertCollectionViewCell

#pragma mark - 刷新数据
- (void)reloadValueByIndexPath:(NSIndexPath *)indexPath arr:(NSArray *)arr {
    
    YXMallSpecificationsMsgModel *msgModel = arr[indexPath.row];
    [self.titleBtn setTitle:msgModel.goodSpecificationsSonTitle forState:UIControlStateNormal];
    
    [self judgeBtnShowByModel:msgModel];
}

#pragma mark - 判定显示
- (void)judgeBtnShowByModel:(YXMallSpecificationsMsgModel *)model {
    
    self.titleBtn.layer.borderColor = [UIColor colorWithHexString:@"#FF2440"].CGColor;
    if ([model.selectedId isEqualToString:model.goodSpecificationsSonIdent]) {
        [self.titleBtn setTitleColor:[UIColor colorWithHexString:@"#FF2440"] forState:UIControlStateNormal];
        self.titleBtn.backgroundColor = [UIColor colorWithHexString:@"#FFF5F6"];
        self.titleBtn.layer.borderWidth = 1;
    }
    else {
        [self.titleBtn setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
        self.titleBtn.backgroundColor = [UIColor colorWithHexString:@"#F6F8F9"];
        self.titleBtn.layer.borderWidth = 0;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
