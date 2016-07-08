//
//  NoticeViewController.m
//  NotificationToValue
//
//  Created by chenq@kensence.com on 14/7/8.
//  Copyright © 2014年 chenq@kensence.com. All rights reserved.
//

#import "NoticeViewController.h"

@interface NoticeViewController ()

@property (nonatomic ,strong)UITextField *text;

@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _text = [[UITextField alloc]initWithFrame:CGRectMake(10, 100, 100, 30)];
    _text.layer.borderColor = [UIColor blackColor].CGColor;
    _text.layer.borderWidth = 0.2;
    [self.view addSubview:_text];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 140, 50, 30);
    [button setTitle:@"传值" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

- (void)ButtonAction:(UIButton *)button
{
    //创建通知
    /*
     *通知发送的都是一个字典
     *传送值包装成字典
     */
    
    NSDictionary *dicy = @{@"value":_text.text};
    [[NSNotificationCenter defaultCenter]postNotificationName:@"PostValue" object:nil userInfo:dicy];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
