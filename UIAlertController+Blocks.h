//
//  UIAlertController+Blocks.
//
//  Created by mac on 16/4/5.
//  Copyright © 2016年 TWJerry. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^actionBlock)(UIAlertAction *action,NSUInteger index);
typedef void(^actionTextFiledBlock)(UIAlertAction *action,NSUInteger index,UITextField *textField);


@interface UIAlertController (Blocks)

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle actions:(NSArray *)actions actionsType:(NSArray *)types actionCallBack:(actionBlock)block controller:(UIViewController *)controller;

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle actions:(NSArray *)actions actionsType:(NSArray *)types actionTextFieldCallBack:(actionTextFiledBlock)actionBlock controller:(UIViewController *)controller;
@end
