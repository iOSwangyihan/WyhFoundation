//
//  OcBaseNaviView.m
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/19.
//


#import "OcBaseNaviView.h"

@implementation OcBaseNaviView
-(UIButton *)closeBt {
    if (_closeBt == nil) {
        _closeBt = [[UIButton alloc]init];
    }
    return _closeBt;
}
-(UIButton *)backBt {
    if (_backBt == nil) {
        _backBt = [[UIButton alloc]init];
    }
    return _backBt;
}
-(UIButton *)refreshBt {
    if (_refreshBt == nil) {
        _refreshBt = [[UIButton alloc]init];
    }
    return _refreshBt;
}
-(UILabel *)titile {
    if (_titile == nil) {
        _titile = [[UILabel alloc]init];
    }
    return _titile;
}
- (void)setNaviType:(NaviType)naviType {
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _naviType = back;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
