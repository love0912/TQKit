//
//  TTBannerFooter.m
//  CQRunner
//
//  Created by 天智慧启 on 2017/6/27.
//  Copyright © 2017年 jason. All rights reserved.
//

#import "TTBannerFooter.h"

#define TT_ARROW_SIDE 15.f

@implementation TTBannerFooter
@synthesize normalTitle = _normalTitle;
@synthesize enterTitle = _enterTitle;

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.imgv_arrow];
        [self addSubview:self.label];
        
        self.imgv_arrow.image = [UIImage imageNamed:@"TTBanner_arrow.png"];
        self.state = TTBannerFooterStateNormal;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat arrowX = self.bounds.size.width / 2 - TT_ARROW_SIDE - 2;
    CGFloat arrowY = self.bounds.size.height / 2 - TT_ARROW_SIDE / 2;
    CGFloat arrowW = TT_ARROW_SIDE;
    CGFloat arrowH = TT_ARROW_SIDE;
    self.imgv_arrow.frame = CGRectMake(arrowX, arrowY, arrowW, arrowH);
    
    CGFloat labelX = self.bounds.size.width / 2 + 2;
    CGFloat labelY = 0;
    CGFloat labelW = TT_ARROW_SIDE;
    CGFloat labelH = self.bounds.size.height;
    self.label.frame = CGRectMake(labelX, labelY, labelW, labelH);
}
#pragma mark - setters & getters
- (void)setState:(TTBannerFooterState)state
{
    _state = state;
    
    switch (state) {
        case TTBannerFooterStateNormal:
        {
            self.label.text = self.normalTitle;
            [UIView animateWithDuration:0.3 animations:^{
                self.imgv_arrow.transform = CGAffineTransformMakeRotation(0);
            }];
            
        }
            break;
        case TTBannerFooterStateEnter:
        {
            self.label.text = self.enterTitle;
            [UIView animateWithDuration:0.3 animations:^{
                self.imgv_arrow.transform = CGAffineTransformMakeRotation(M_PI);
            }];
        }
            break;
            
        default:
            break;
    }
}

- (UIImageView *)imgv_arrow
{
    if (!_imgv_arrow) {
        _imgv_arrow = [[UIImageView alloc] init];
    }
    return _imgv_arrow;
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:13];
        _label.textColor = [UIColor darkGrayColor];
        _label.numberOfLines = 0;
        _label.adjustsFontSizeToFitWidth = YES;
    }
    return _label;
}

- (void)setNormalTitle:(NSString *)normalTitle
{
    _normalTitle = normalTitle;
    
    if (self.state == TTBannerFooterStateNormal) {
        self.label.text = normalTitle;
    }
}

- (NSString *)normalTitle
{
    if (!_normalTitle) {
        _normalTitle = @"拖动查看详情"; // default
    }
    return _normalTitle;
}

- (void)setEnterTitle:(NSString *)enterTitle
{
    _enterTitle = enterTitle;
    
    if (self.state == TTBannerFooterStateEnter) {
        self.label.text = enterTitle;
    }
}

- (NSString *)enterTitle
{
    if (!_enterTitle) {
        _enterTitle = @"释放查看详情"; // default
    }
    return _enterTitle;
}


@end
