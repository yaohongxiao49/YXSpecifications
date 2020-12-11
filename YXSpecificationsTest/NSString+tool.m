//
//  NSString+tool.m
//  categoryTest
//
//  Created by 王文 on 16/6/22.
//  Copyright © 2016年 volientDuan. All rights reserved.
//

#import "NSString+tool.h"

@implementation NSString (tool)

- (BOOL)hasValue {
    
    return ([self isKindOfClass:[NSString class]] && self.length > 0);
}

@end
