//
//  CircleView.h
//  九宫格手势密码
//
//  Created by 石纯勇 on 16/5/6.
//  Copyright © 2016年 石纯勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView
{
    UIImage *_ordinaryImg;
    UIImage *_selectedImg;
    BOOL     _selected;
    
    @private
    UIImageView *_ordinaryImgView;
    UIImageView *_selectedImgView;
}

@property (strong, nonatomic) UIImage *ordinaryImg;/**<正常图标>*/
@property (strong, nonatomic) UIImage *selectedImg;/**<点击图标>*/
@property (assign, nonatomic) BOOL     selected;/**<是否选择>*/
@end
