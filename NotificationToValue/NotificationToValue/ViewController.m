//
//  ViewController.m
//  NotificationToValue
//
//  Created by chenq@kensence.com on 14/7/8.
//  Copyright © 2014年 chenq@kensence.com. All rights reserved.
//

#import "ViewController.h"
#import "NoticeViewController.h"

@interface ViewController ()

@property (nonatomic ,strong)UILabel *labe;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _labe = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 100)];
    _labe.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_labe];
    
    //注册通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notice:) name:@"PostValue" object:nil];
  
}

- (void)notice:(NSNotification *)notice
{
    //接受通知传值并赋值
    NSString *string = [notice.userInfo valueForKey:@"value"];
    _labe.text = string;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NoticeViewController *noticeVC = [NoticeViewController new];
    [self.navigationController presentViewController:noticeVC animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
