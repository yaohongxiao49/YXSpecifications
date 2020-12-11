//
//  YXMallSpecificationsAlertModel.m
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import "YXMallSpecificationsModel.h"

@implementation YXMallSpecificationsModel

+ (NSMutableArray *)arrayOfModelsFromDictionaries:(NSArray *)arr {
    
    NSMutableArray *dataAry = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        YXShoppingCartListGoodsInfoModel *model = [[YXShoppingCartListGoodsInfoModel alloc] initWithDic:dic];
        
        [dataAry addObject:model];
    }
    return dataAry;
}

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    
    if (self) {
        
    }
    return self;
}

@end
