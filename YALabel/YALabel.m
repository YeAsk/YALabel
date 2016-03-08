//
//  YALabel.m
//  MenuController
//
//  Created by 蔡文宇 on 16/3/8.
//  Copyright © 2016年 蔡文宇. All rights reserved.
// 一个可以拷贝、剪切、粘贴文本的label，a label that can be cut\copy\paste with it

#import "YALabel.h"

@implementation YALabel
-(void)awakeFromNib{
    [self setup];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(void)setup{
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)]];
}

-(void)labelClick{
    //告诉menu支持哪些操作 tell menu what can be done with label
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    //method 1
    [menu setMenuVisible:YES animated:YES];
    //method 2
    //[menu setTargetRect:self.bounds inView:self];
    [menu setTargetRect:self.frame inView:self.superview];
}
/**
 *  能执行哪些操作 which action can be done with label
 */
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(cut:) || action == @selector(copy:) || action == @selector(paste:)) {
        return YES;
    }
    return NO;
}
/**
 *  !important
 */
-(BOOL)canBecomeFirstResponder{
    return true;
}
/**
 *  copy
 */
-(void)copy:(id)sender{
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    if (self.text) {
        board.string = self.text;
    }
}
/**
 *  paste
 */
-(void)paste:(id)sender{
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    if (self.text) {
        self.text = board.string;
    }

}
/**
 *  cut
 */
-(void)cut:(id)sender{
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    if (self.text) {
        board.string = self.text;
        self.text = nil;
    }

}


@end
