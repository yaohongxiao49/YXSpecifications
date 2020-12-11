//
//  YXMallSpecificationsMsgModel.m
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import "YXMallSpecificationsMsgModel.h"

@implementation YXMallSpecificationsMsgModel

+ (NSMutableArray *)arrayOfModelsFromDictionaries:(NSArray *)arr {
    
    NSMutableArray *dataAry = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        YXMallSpecificationsMsgModel *model = [[YXMallSpecificationsMsgModel alloc] initWithDic:dic];
        [dataAry addObject:model];
    }
    return dataAry;
}

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    
    if (self) {
        _goodSpecificationsFatherIdent = [dic objectForKey:@"goodSpecificationsFatherIdent"];
        _goodSpecificationsFatherTitle = [dic objectForKey:@"goodSpecificationsFatherTitle"];
        
        _goodSpecificationsSonArr = [YXMallSpecificationsMsgModel arrayOfModelsFromDictionaries:[dic objectForKey:@"goodSpecificationsSonArr"]];
        _goodSpecificationsSonIdent = [dic objectForKey:@"goodSpecificationsSonIdent"];
        _goodSpecificationsSonTitle = [dic objectForKey:@"goodSpecificationsSonTitle"];
        _boolSelected = [[dic objectForKey:@"boolSelected"] boolValue];
    }
    return self;
}

@end
