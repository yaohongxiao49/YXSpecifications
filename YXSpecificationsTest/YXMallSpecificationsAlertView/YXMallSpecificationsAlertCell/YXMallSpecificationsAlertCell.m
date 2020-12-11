//
//  YXMallSpecificationsAlertCell.m
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import "YXMallSpecificationsAlertCell.h"

@implementation YXMallSpecificationsAlertCellFlowLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    for(NSInteger i = 1; i < [attributes count]; i++) {
        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
        UICollectionViewLayoutAttributes *prevLayoutAttributes = attributes[i - 1];
        NSInteger prevorigin = CGRectGetMaxX(prevLayoutAttributes.frame);
        NSInteger curIndex = currentLayoutAttributes.indexPath.section;
        NSInteger preIndex = prevLayoutAttributes.indexPath.section;
        if (curIndex != preIndex) { //如果是分组进行跳过
            continue;
        }
        if (prevorigin + 30 + currentLayoutAttributes.frame.size.width <= self.collectionViewContentSize.width) {
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = prevorigin + 12;
            currentLayoutAttributes.frame = frame;
        }
    }
    
    return attributes;
}

@end

@interface YXMallSpecificationsAlertCell () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy) YXMallSpecificationsModel *model;
@property (nonatomic, copy) YXMallSpecificationsMsgModel *msgModel;

@end

@implementation YXMallSpecificationsAlertCell

- (void)reloadValueByIndexPath:(NSIndexPath *)indexPath model:(YXMallSpecificationsModel *)model {
    
    _model = model;
    YXMallSpecificationsMsgModel *msgModel = _model.goodsSpecificationMsgArr[indexPath.section];
    _msgModel = msgModel;
    
    [self.collectionView reloadData];
}

#pragma mark - 回传高度
- (CGFloat)getCollectionViewHeight {
    
    [self.collectionView layoutIfNeeded];
    return self.collectionView.collectionViewLayout.collectionViewContentSize.height;
}

#pragma mark - 组装选中数据
- (void)assemblyBoolSelecteArr {
    
    for (YXMallSpecificationsMsgModel *msgModel in _msgModel.goodSpecificationsSonArr) {
        msgModel.selectedId = @"";
    }
}

#pragma mark - <UICollectionViewDataSource, UICollectionViewDelegate>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _msgModel.goodSpecificationsSonArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YXMallSpecificationAlertCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([YXMallSpecificationAlertCollectionViewCell class]) forIndexPath:indexPath];
    [cell reloadValueByIndexPath:indexPath arr:_msgModel.goodSpecificationsSonArr model:_model];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self assemblyBoolSelecteArr];
    YXMallSpecificationsMsgModel *msgModel = _msgModel.goodSpecificationsSonArr[indexPath.row];
    msgModel.selectedId = msgModel.goodSpecificationsSonIdent;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kYXMallSpecificationsReloadValueNoti object:nil];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    YXMallSpecificationsMsgModel *msgModel = _msgModel.goodSpecificationsSonArr[indexPath.row];
//    CGFloat w = 20 + [YCCommonMethod strWidthWithStr:text height:20 font:[UIFont boldSystemFontOfSize:11]];
    
    return CGSizeMake(80, 30);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 15, 10, 15);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 10;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    YXMallSpecificationsAlertCellFlowLayout *layout = [[YXMallSpecificationsAlertCellFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:[YXMallSpecificationAlertCollectionViewCell.class description] bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([YXMallSpecificationAlertCollectionViewCell class])];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.collectionViewConstraintHeight.constant = [self getCollectionViewHeight];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
