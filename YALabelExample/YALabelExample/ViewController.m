//
//  ViewController.m
//  YALabelExample
//
//  Created by 蔡文宇 on 16/3/8.
//  Copyright © 2016年 YaAsk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
