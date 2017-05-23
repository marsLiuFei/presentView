//
//  ViewController.m
//  presentView
//
//  Created by apple on 2017/4/29.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "ViewController.h"
#import "XHHTuanNumView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
}
- (IBAction)showView:(UIButton *)sender {
    XHHTuanNumView * vc = [XHHTuanNumView new];

    
    [vc showInView:self.view];
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
