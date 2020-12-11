//
//  YXMallSpecificationsAlertModel.m
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import "YXMallSpecificationsModel.h"

@implementation YXMallSpecificationsModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    
    if (self) {
        //基本信息
        self.goodsImgUrl = [dic objectForKey:@"goodsImgUrl"];
        self.goodsPrice = [dic objectForKey:@"goodsPrice"];
        self.goodsSpecificationNum = [dic objectForKey:@"goodsSpecificationNum"];
        
        //选购数量及限制
        self.goodsCurrentNum = [[dic objectForKey:@"goodsCurrentNum"] integerValue];
        self.goodsMaxNum = [[dic objectForKey:@"goodsMaxNum"] integerValue];
        self.goodsMinNum = [[dic objectForKey:@"goodsMinNum"] integerValue];
        
        //如果当前数小于起购数，则默认为起购数
        if (self.goodsCurrentNum < self.goodsMinNum) {
            self.goodsCurrentNum = self.goodsMinNum;
        }
        
        //规格
        self.goodsSpecificationMsgArr = [YXMallSpecificationsMsgModel arrayOfModelsFromDictionaries:[dic objectForKey:@"goodsSpecificationMsgArr"]];
    }
    return self;
}

@end
