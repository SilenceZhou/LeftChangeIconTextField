//
//  zyViewController.m
//  LeftChangeIconTextField
//
//  Created by SilenceZhou on 05/05/2017.
//  Copyright (c) 2017 SilenceZhou. All rights reserved.
//

#import "zyViewController.h"
#import "LeftChangeIconTextField.h"

@interface zyViewController ()

@end

@implementation zyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    LeftChangeIconTextField *textField = [[LeftChangeIconTextField alloc] initWithFrame:CGRectMake(100, 100, 250, 50)];
    
    
    [textField setLeftImage:[UIImage imageNamed:@"icon_tf_passwore_normal"] forState:TextFieldLeftIconStateNormal];
    [textField setLeftImage:[UIImage imageNamed:@"icon_tf_passwore_select"] forState:TextFieldLeftIconStateHasText];
    
    textField.borderStyle = UITextBorderStyleBezel;
    
    [self.view addSubview:textField];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
