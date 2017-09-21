//
//  NineLockView.m
//  九宫格手势密码
//
//  Created by 石纯勇 on 16/5/6.
//  Copyright © 2016年 石纯勇. All rights reserved.
//

#import "NineLockView.h"
#import "CircleView.h"

@implementation NineLockView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addNineCircleView];
    }
    return self;
}

- (void)addNineCircleView {
    
    _circleViewArray = [NSMutableArray array];
    _selectedArray = [NSMutableArray array];
    
    CGFloat selfHeight = CGRectGetWidth(self.frame);
    
    circleSize = selfHeight/4;
    
    for (int i=0; i<9; i++) {
        CGRect rect = CGRectMake((i%3)*circleSize+(i%3)*circleSize/2, (i/3)*circleSize+(i/3)*circleSize/2, circleSize, circleSize);
        CircleView *circleView = [[CircleView alloc]initWithFrame:rect];
        circleView.tag = 10000+i;
        circleView.ordinaryImg = [UIImage imageNamed:@"circle_normal.png"];
        circleView.selectedImg = [UIImage imageNamed:@"circle_selected.png"];
        circleView.selected = NO;
        
        circleView.backgroundColor = [UIColor clearColor];
        [self addSubview:circleView];
        
        [_circleViewArray addObject:circleView];
    }
}

#pragma mark - 事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self];
    [self judgmentTouchTheCircleView:point];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    CGPoint point = [[touches anyObject] locationInView:self];
    [self judgmentTouchTheCircleView:point];
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self success];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self clear];
}

- (void)judgmentTouchTheCircleView:(CGPoint)point {
    for (CircleView *view in _circleViewArray) {
        if(fabs(view.center.x - point.x)<=view.frame.size.width/2 && fabs(view.center.y-point.y)<=view.frame.size.width/2 ) {
            if (!view.selected) {
                view.selected = YES;
                [_selectedArray addObject:view];
            }
            break;
        }
    }
    
    nowPoint = point;
    [self setNeedsDisplay];
}

- (void)clear{
    for (CircleView *v in _circleViewArray) {
        v.selected = NO;
    }
    [_selectedArray removeAllObjects];
    [self setNeedsDisplay];
}

- (void)success {
    NSMutableString *str = [NSMutableString string];
    for (UIView *selectedView in _selectedArray) {
        [str appendString:[NSString stringWithFormat:@"%ld", selectedView.tag-10000]];
    }
    [self clear];
    if (self.lockSuccess) {
        self.lockSuccess(str);
    }
}

- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    if (_selectedArray.count == 0) {
        return;
    }
    [[UIColor blueColor] set];
    CGContextSetLineWidth(context, 2);
    
    CircleView *circle = _selectedArray.firstObject;
    CGPoint originPoint = circle.center;
    
    int i=0;
    for (CircleView *circle in _selectedArray) {
            //已选择的连线
        if (i != 0) {
            CGContextMoveToPoint(context, originPoint.x, originPoint.y);
            CGContextAddLineToPoint(context, circle.center.x, circle.center.y);
            originPoint = circle.center;
        }
        i++;
    }
    
    // 画当前线
    CircleView* v = _selectedArray.lastObject;
    CGContextMoveToPoint(context, v.center.x, v.center.y);
    CGContextAddLineToPoint(context, nowPoint.x, nowPoint.y);
    CGContextStrokePath(context);
}


@end
