//
//  XLJScrollView.h
//  XLJSegScrollView
//
//  Created by m on 2016/10/20.
//  Copyright © 2016年 XLJ. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "XLJSegment.h"
@interface XLJScrollView : UIScrollView

- (instancetype)initWithFrame:(CGRect)frame withArray:(NSMutableArray *)mArray;

- (void)addTagert:(id)target action:(SEL)action;

@end
