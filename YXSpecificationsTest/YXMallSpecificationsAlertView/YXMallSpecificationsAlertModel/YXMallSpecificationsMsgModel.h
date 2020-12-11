//
//  YXMallSpecificationsMsgModel.h
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXMallSpecificationsMsgModel : NSObject

/** 规格父id */
@property (nonatomic, copy) NSString *goodSpecificationsFatherIdent;
/** 规格父标题 */
@property (nonatomic, copy) NSString *goodSpecificationsFatherTitle;

/** 规格子规格 */
@property (nonatomic, copy) NSArray *goodSpecificationsSonArr;
/** 规格子id */
@property (nonatomic, copy) NSString *goodSpecificationsSonIdent;
/** 规格子标题 */
@property (nonatomic, copy) NSString *goodSpecificationsSonTitle;
/** 规格是否选中 */
@property (nonatomic, assign) BOOL boolSelected;

+ (NSMutableArray *)arrayOfModelsFromDictionaries:(NSArray *)arr;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
