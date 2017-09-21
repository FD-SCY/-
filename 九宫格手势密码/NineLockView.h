//
//  NineLockView.h
//  九宫格手势密码
//
//  Created by 石纯勇 on 16/5/6.
//  Copyright © 2016年 石纯勇. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NineLockView : UIView
{
    @private
    NSMutableArray *_circleViewArray;
    NSMutableArray *_selectedArray;
    
    CGPoint        nowPoint;
    CGFloat        circleSize;
}

@property (nonatomic, copy) void(^lockSuccess)(NSString *psw);
@end
