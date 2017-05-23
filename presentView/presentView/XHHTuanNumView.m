//
//  XHHTuanNumView.m
//  presentView
//
//  Created by apple on 2017/4/29.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "XHHTuanNumView.h"

#define UI_navBar_Height 64.0

#define UI_View_Width  [UIScreen mainScreen].bounds.size.width
#define UI_View_Height [UIScreen mainScreen].bounds.size.height

@interface XHHTuanNumView()
{
    UIView *_contentView;
    
}
@end

@implementation XHHTuanNumView

- (id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        
        [self setupContent];
    }
    
    return self;
}

- (void)setupContent {
    self.frame = CGRectMake(0, 0, UI_View_Width,UI_View_Height);
    
    //alpha 0.0  白色   alpha 1 ：黑色   alpha 0～1 ：遮罩颜色，逐渐
    self.backgroundColor = [UIColor colorWithWhite:0.6 alpha:0.7];
    self.userInteractionEnabled = YES;
    
//    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];//点击空白地方移除视图
    
    if (_contentView == nil) {
        
//        CGFloat margin = 15;
        
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(30, UI_View_Height*0.5 - XHHTuanNumViewHight*0.5, UI_View_Width-60, XHHTuanNumViewHight)];
        
        
        
        _contentView.layer.cornerRadius = 5;
        _contentView.layer.masksToBounds=YES;
        
        
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
        // 右上角关闭按钮
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
      
        
        closeBtn.frame = CGRectMake(_contentView.frame.size.width - 20 - 15, 15, 20, 20);
        [closeBtn setImage:[UIImage imageNamed:@"错误"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(disMissView) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:closeBtn];
    }
}

//展示从底部向上弹出的UIView（包含遮罩）
- (void)showInView:(UIView *)view {
    if (!view) {
        return;
    }
    
    [view addSubview:self];
    [view addSubview:_contentView];
    
    [_contentView setFrame:CGRectMake(30, UI_View_Height*0.5 - XHHTuanNumViewHight*0.5 , UI_View_Width-60, XHHTuanNumViewHight)];
    _contentView.alpha=0;
    _contentView.transform = CGAffineTransformMakeScale(0.7, 0.7);
    
    
    self.alpha = 0;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 1.0;
        
//        [_contentView setFrame:CGRectMake(30, UI_View_Height*0.5 - XHHTuanNumViewHight*0.5 , UI_View_Width-60, XHHTuanNumViewHight)];
        _contentView.alpha = 1;
        _contentView.transform = CGAffineTransformMakeScale(1, 1);
        
    } completion:nil];
}

//移除从上向底部弹下去的UIView（包含遮罩）
- (void)disMissView {    
    [_contentView setFrame:CGRectMake(30, UI_View_Height*0.5 - XHHTuanNumViewHight*0.5, UI_View_Width-60, XHHTuanNumViewHight)];
    _contentView.transform = CGAffineTransformMakeScale(1, 1);
    _contentView.alpha = 1;
//    self.alpha=1.0;
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [_contentView setFrame:CGRectMake(30, UI_View_Height*0.5 - XHHTuanNumViewHight*0.5 , UI_View_Width-60, XHHTuanNumViewHight)];
                         _contentView.transform = CGAffineTransformMakeScale(0.5, 0.5);
                         _contentView.alpha=0.0;
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         [_contentView removeFromSuperview];
                         
                     }];
    
}


@end
