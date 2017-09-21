//
//  CircleView.m
//  九宫格手势密码
//
//  Created by 石纯勇 on 16/5/6.
//  Copyright © 2016年 石纯勇. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView
@synthesize ordinaryImg = _ordinaryImg, selectedImg = _selectedImg, selected = _selected;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _selected = NO;
        
        _ordinaryImgView = [[UIImageView alloc]initWithFrame:self.bounds];
        _selectedImgView = [[UIImageView alloc]initWithFrame:self.bounds];
        
        [_ordinaryImgView setHidden:_selected];
        [_selectedImgView setHidden:!_selected];
        
        [self addSubview:_ordinaryImgView];
        [self addSubview:_selectedImgView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    if (_selected != selected) {
        _selected = selected;
    }
    [_ordinaryImgView setHidden:_selected];
    [_selectedImgView setHidden:!_selected];
    [self setNeedsLayout];
}

- (void)setSelectedImg:(UIImage *)selectedImg {
    if (_selectedImg != selectedImg) {
        _selectedImg = selectedImg;
    }
    _selectedImgView.image = _selectedImg;
}

- (void)setOrdinaryImg:(UIImage *)ordinaryImg {
    if (_ordinaryImg != ordinaryImg) {
        _ordinaryImg = ordinaryImg;
    }
    _ordinaryImgView.image = _ordinaryImg;
}
@end
