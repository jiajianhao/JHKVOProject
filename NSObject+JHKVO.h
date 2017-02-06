//
//  NSObject+JHKVO.h
//  JHKVOProject
//
//  Created by admin on 2017/2/6.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JHObservingBlock)(id observedObject, NSString *observedKey, id oldValue, id newValue);

@interface NSObject (JHKVO)

- (void)JH_addObserver:(NSObject *)observer
                forKey:(NSString *)key
             withBlock:(JHObservingBlock)block;
- (void)JH_removeObserver:(NSObject *)observer forKey:(NSString *)key;

@end
