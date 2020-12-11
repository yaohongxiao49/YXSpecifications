//
//  YXMallSpecificationsAlertModel.h
//  YXSpecificationsTest
//
//  Created by ios on 2020/12/11.
//

#import <Foundation/Foundation.h>
#import "YXMallSpecificationsMsgModel.h"

NS_ASSUME_NONNULL_BEGIN

/** 规格信息更新 */
#define kYXMallSpecificationsReloadValueNoti @"kYXMallSpecificationsReloadValueNoti"

@interface YXMallSpecificationsModel : NSObject

/** 商品图片 */
@property (nonatomic, copy) NSString *goodsImgUrl;
/** 商品价格 */
@property (nonatomic, copy) NSString *goodsPrice;
/** 商品规格编号 */
@property (nonatomic, copy) NSString *goodsSpecificationNum;

/** 商品当前数量 */
@property (nonatomic, assign) NSInteger goodsCurrentNum;
/** 商品最大库存 */
@property (nonatomic, assign) NSInteger goodsMaxNum;
/** 商品起购数 */
@property (nonatomic, assign) NSInteger goodsMinNum;

/** 规格信息 */
@property (nonatomic, copy) NSArray *goodsSpecificationMsgArr;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
