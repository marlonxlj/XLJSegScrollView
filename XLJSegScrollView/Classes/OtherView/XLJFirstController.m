//
//  XLJFirstController.m
//  XLJSegScrollView
//
//  Created by m on 2016/10/18.
//  Copyright © 2016年 XLJ. All rights reserved.
//

#import "XLJFirstController.h"
#import "XLJTestGepController.h"

#import "XLJScrollView.h"
#import "XLJSegment.h"

//子视图
#import "XLJRecommendController.h"
#import "XLJYongController.h"
#import "XLJActivityController.h"
#import "XLJTomorrowController.h"
#import "XLJMusicController.h"
#import "XLJVedioController.h"
#import "XLJWellComeController.h"
#import "XLJPersonalController.h"

@interface XLJFirstController ()

@property (nonatomic, strong) NSMutableArray *titleChild;

@end

@implementation XLJFirstController

- (NSMutableArray *)titleChild
{
    if (!_titleChild) {
        _titleChild = @[].mutableCopy;
    }
    return _titleChild;
}
#pragma mark -- 测试navgation手势返回方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    XLJTestGepController *test = [XLJTestGepController new];
//    
//    [self.navigationController pushViewController:test animated:YES];
    
//    XLJScrollView *topScrollView = [[XLJScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
//    topScrollView.backgroundColor = [UIColor lightGrayColor];
//    
//    [self.view addSubview:topScrollView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.alpha = 1;
    
    //1.设置标题按钮
    [self settingTitleButton];
    
    //2.添加标题的子视图
//    [self addChildTtitleButton];
}

- (void)childViewController:(XLJBaseController *)control
{
    
    [self.titleChild removeAllObjects];
    
    XLJBaseController *newVC = [[XLJBaseController alloc] init];
    
    newVC = control;
    
    [self addChildViewController:newVC];
    
    
    NSMutableArray *marray = @[].mutableCopy;
    
    [marray addObject:newVC.view];
    
//    XLJScrollView *topScrollView = [[XLJScrollView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), 40) withArray:marray];
//    topScrollView.backgroundColor = [UIColor lightGrayColor];
//    
//    [self.view addSubview:topScrollView];
//    
//    [topScrollView addTagert:self action:@selector(onClicked:)];
//
    
    self.titleChild = marray;
//    return self.titleChild;
    
}
#pragma mark -- 添加标题的子视图
- (void)addChildTtitleButton
{
    //1.把子视图添加到self的子视图中
    XLJRecommendController *reVC = [XLJRecommendController new];
    [self addChildViewController:reVC];
    
    XLJYongController *yongVC = [XLJYongController new];
    [self addChildViewController:yongVC];
    
    XLJActivityController *acVC = [XLJActivityController new];
    [self addChildViewController:acVC];
    
    XLJTomorrowController *toVC = [XLJTomorrowController new];
    
    [self addChildViewController:toVC];
    
    XLJMusicController *muVC = [XLJMusicController new];
    [self addChildViewController:muVC];
    
    XLJVedioController *veVC = [XLJVedioController new];
    [self addChildViewController:veVC];
    
    XLJWellComeController *weVC = [XLJWellComeController new];
    [self addChildViewController:weVC];
    
    XLJPersonalController *prVC = [XLJPersonalController new];
    [self addChildViewController:prVC];
    
    
    //2.把滚动的scrollView添加到self.viw上
 
    NSMutableArray *marray = @[reVC.view,yongVC.view,acVC.view,toVC.view,muVC.view,veVC.view,weVC.view,prVC.view].mutableCopy;
    
    
    XLJScrollView *childScrollView = [[XLJScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) withArray:marray];
    childScrollView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:childScrollView];
    
    [childScrollView addTagert:self action:@selector(childAction:)];
}


#pragma mark -- 设置标题按钮
- (void)settingTitleButton
{
    //这句话没有作用，不知道是什么？？？
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    //下面这句话有作用???
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //self.navigationItem.title = @"First";此方法有作用
    NSMutableArray *marray = @[@"推荐大家",@"少年",@"活动介绍中",@"明天约",@"音乐乐天",@"视频动画",@"欢迎来到这里",@"个人介绍"].mutableCopy;
    
    
    XLJScrollView *topScrollView = [[XLJScrollView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), 40) withArray:marray];
    topScrollView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:topScrollView];
    
    [topScrollView addTagert:self action:@selector(onClicked:)];

}

- (void)onClicked:(UIButton *)btn
{
    NSLog(@"AAAA");
    dispatch_async(dispatch_get_main_queue(), ^{
        
//        _trendTableViews.selectedIndex = _trendScrollView.selectedIndex;
        
    });

}

- (void)childAction
{
    NSLog(@"BBBB");
}


@end
