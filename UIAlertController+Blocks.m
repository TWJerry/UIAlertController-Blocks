//
//  UIAlertController+Blocks.m
//  UIAlertView+Extension

//  Created by mac on 16/4/5.
//  Copyright © 2016年 TWJerry. All rights reserved.
//

#import "UIAlertController+Blocks.h"

@implementation UIAlertController (Blocks)
+ (void)alertWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle actions:(NSArray *)actions actionsType:(NSArray *)types actionCallBack:(actionBlock)block controller:(UIViewController *)controller
{
    [self checkActions:actions andTypes:types];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    [actions enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *actions = [UIAlertAction actionWithTitle:(NSString *)obj style:(UIAlertActionStyle)[[types objectAtIndex:idx] intValue] handler:^(UIAlertAction * _Nonnull action) {
            block(action,idx);
        }];
        [alertController addAction:actions];
    }];
    [controller presentViewController:alertController animated:YES completion:nil];
}

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle actions:(NSArray *)actions actionsType:(NSArray *)types actionTextFieldCallBack:(actionTextFiledBlock)actionTextFieldBlock controller:(UIViewController *)controller
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    // you can add textFields,but you should modify my codes to adapt to your requirements
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    
    UITextField *textField = (UITextField *)[alertController.textFields objectAtIndex:0];
    [actions enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:(NSString *)obj style:(UIAlertActionStyle)[[types objectAtIndex:idx] intValue]handler:^(UIAlertAction * _Nonnull action) {
            actionTextFieldBlock(action,idx,textField);
        }];
        [alertController addAction:action];
    }];
    
    [controller presentViewController:alertController animated:YES completion:nil];
}

+ (void)checkActions:(NSArray *)actions andTypes:(NSArray *)types
{
    NSAssert(actions.count == types.count, @"elements in the actions can't match the elements in types");
    
    __block NSInteger cancles = 0;
    [types enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqual:@1]) {
            cancles ++;
        }
    }];
    NSAssert(cancles <= 1, @"UIAlertActionStyleCancel can't more than two in  UIAlertController");
}

@end
