//
//  YXMallSpecificationsAlertModel.h
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXMallSpecificationsModel : NSObject

/** 商品图片 */
@property (nonatomic, copy) NSString *goodsImgUrl;
/** 商品价格 */
@property (nonatomic, copy) NSString *goodsPrice;
/** 商品规格编号 */
@property (nonatomic, copy) NSString *goodsSpecificationNumber;
/** 规格信息 */
@property (nonatomic, copy) NSArray *goodsSpecificationMsgArr;

+ (NSMutableArray *)arrayOfModelsFromDictionaries:(NSArray *)arr;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
