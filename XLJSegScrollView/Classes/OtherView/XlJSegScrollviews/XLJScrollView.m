//
//  XLJScrollView.m
//  XLJSegScrollView
//
//  Created by m on 2016/10/20.
//  Copyright © 2016年 XLJ. All rights reserved.
//

#import "XLJScrollView.h"
#import "XLJSegment.h"

@interface XLJScrollView ()

@property (nonatomic, strong) NSMutableArray *itemArray;

@property (nonatomic, strong) XLJSegment *segMent;
//事件对象
@property (nonatomic, strong) id target;
@property (nonatomic, assign) SEL action;
@property (nonatomic, assign) BOOL isFirstLayoutSubview;


@end

@implementation XLJScrollView

- (NSMutableArray *)itemArray
{
    if (!_itemArray) {
        _itemArray = @[].mutableCopy;
    }
    return _itemArray;
}

- (XLJSegment *)segMent
{
    if (!_segMent) {
        //实现滚动按钮，但是没有实现滚动的位置问题
//        _segMent = [[XLJSegment alloc] initWithSegmentFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 35) withButtonTitleItems:self.itemArray withButtonFontSize:20 withSliderColor:[UIColor whiteColor]];
        
        _segMent = [[XLJSegment alloc] initWithSegmentFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 35) withButtonTitleItems:self.itemArray withButtonFontSize:20 withSliderColor:[UIColor whiteColor]];
        
        [_segMent addTagert:self action:@selector(onButtonClicked:)];
    }
    
    return _segMent;
}
- (instancetype)initWithFrame:(CGRect)frame withArray:(NSMutableArray *)mArray
{
    if (self = [super initWithFrame:frame]) {
        self.itemArray = mArray;
        self.isFirstLayoutSubview = YES;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.isFirstLayoutSubview) {
        //添加子控件
        [self addSegment];

    }
    
}

//添加子控件
- (void)addSegment
{
    //1.把segMent添加到scrollView上面
    [self addSubview:self.segMent];
    
    //2.设置scrollView的属性
    //关闭垂直、水平滚动条
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;

    //关闭弹簧效果
    self.bounces = NO;
    //滑动范围
    //这两句话的意思是一样的
    // self.contentSize = CGSizeMake(self.segMent.frame.size.width, 0);
    self.contentSize = CGSizeMake(CGRectGetWidth(self.segMent.frame), 0);
    self.isFirstLayoutSubview = NO;
}

- (void)addTagert:(id)target action:(SEL)action
{
    self.target = target;
    self.action = action;
}

- (void)onButtonClicked:(UIButton *)button
{
    if ([self.target respondsToSelector:self.action]) {
        [self.target performSelector:self.action withObject:self afterDelay:0.0f];
    }
}

@end
