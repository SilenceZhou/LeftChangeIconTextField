//
//  LeftChangeIconTextField.m
//  
//
//  Created by silence on 16/4/12.
//  Copyright © 2016年 silence. All rights reserved.
//

#import "LeftChangeIconTextField.h"

@interface LeftChangeIconTextField ()

@property (nonatomic, strong) UIImageView *leftImageV;  /**< 左边图片 */
@property (nonatomic, strong) UIView *leftImgContentV;  /**< 左边视图的容器 */
@property (nonatomic, strong) UIImage *leftNormalImage; /**< 保存正常状态下的图片 */
@property (nonatomic, strong) UIImage *leftHasTextImage;/**< 保存有图片的时候图片 */

@end



@implementation LeftChangeIconTextField

#pragma mark - Public Methods

- (void)setLeftImage:(UIImage *)image forState:(TextFieldLeftIconState)state
{
    if (state == TextFieldLeftIconStateNormal) { // 正常状态
        
        self.leftNormalImage = image;
        self.leftImageV.image = image;
    } else { //有文案状态
        self.leftHasTextImage = image;
    }
}


#pragma mark - Life Cycle

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidEndEditingNotification object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
        
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    [self.leftImgContentV addSubview:self.leftImageV];
    self.leftView = self.leftImgContentV;
    self.leftViewMode = UITextFieldViewModeAlways;
    
    self.leftImgContentV.frame = CGRectMake(0, 0, (14 + 20), self.frame.size.height);
    self.leftImageV.frame = CGRectMake(10,  0, 14 , 18 );
    
    self.leftImageV.center = CGPointMake(self.leftImgContentV.frame.size.width /2. , self.leftImgContentV.frame.size.height / 2.);
    [self monitorIsFirstResponder];
}

- (void)monitorIsFirstResponder
{

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didChangeTextField:)
                                                 name:UITextFieldTextDidBeginEditingNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didChangeTextField:)
                                                 name:UITextFieldTextDidEndEditingNotification
                                               object:nil];
}




- (void)didChangeTextField:(NSNotification *)notification
{
    if (self.isFirstResponder) {
        self.leftImageV.image = self.leftHasTextImage;
    } else {
        self.leftImageV.image = self.leftNormalImage;
    }
    
    if (self.leftChangeDelegate && [self.leftChangeDelegate respondsToSelector:@selector(leftChangeIconTextField:isFirstResponder:)]) {
        [self.leftChangeDelegate leftChangeIconTextField:self isFirstResponder:self.isFirstResponder];
    }
}


#pragma mark - Properties

- (UIImageView *)leftImageV
{
    if (!_leftImageV) {
        _leftImageV = [[UIImageView alloc] init];
        _leftImageV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _leftImageV;
}


- (UIView *)leftImgContentV
{
    if (!_leftImgContentV) {
        _leftImgContentV = [[UIView alloc] init];
    }
    return _leftImgContentV;
}


@end
