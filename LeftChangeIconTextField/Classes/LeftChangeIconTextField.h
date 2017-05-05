//
//  LeftChangeIconTextField.h
//
//
//  Created by silence on 16/4/12.
//  Copyright © 2016年 silence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, TextFieldLeftIconState) {
    TextFieldLeftIconStateNormal, /**< 正常状态 */
    TextFieldLeftIconStateHasText /**< 有文案或者高亮状态 */
};


@class LeftChangeIconTextField;
@protocol LeftChangeIconTextFieldDelegate <NSObject>

@optional
- (void)leftChangeIconTextField:(LeftChangeIconTextField *)textField isFirstResponder:(BOOL)isFirstResponder;

@end


@interface LeftChangeIconTextField : UITextField

@property (nonatomic, weak) id<LeftChangeIconTextFieldDelegate> leftChangeDelegate;

/**
 *  给不同状态下的TextField进行leftImage的更改
 *
 *  @param image 图片
 *  @param state 状态
 */
- (void)setLeftImage:(UIImage *)image forState:(TextFieldLeftIconState)state;
@end
