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
        [_closeBt setImage:[UIImage imageNamed:@"ic_nav_close"] forState:UIControlStateNormal];
        _closeBt.titleLabel.font = [UIFont systemFontOfSize:16];
        [_closeBt setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        _closeBt.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 22);
    }
    return _closeBt;
}
-(UIButton *)backBt {
    if (_backBt == nil) {
        _backBt = [[UIButton alloc]init];
        [_backBt setImage:[UIImage imageNamed:@"ic_back_black"] forState:UIControlStateNormal];
        _backBt.titleLabel.font = [UIFont systemFontOfSize:16];
        [_backBt setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        _backBt.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 22);
    }
    return _backBt;
}
-(UIButton *)refreshBt {
    if (_refreshBt == nil) {
        _refreshBt = [[UIButton alloc]init];
        [_refreshBt setImage:[UIImage imageNamed:@"ic_refresh"] forState:UIControlStateNormal];
        _refreshBt.titleLabel.font = [UIFont systemFontOfSize:16];
        _refreshBt.titleLabel.textAlignment = NSTextAlignmentRight;
        [_refreshBt setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        _refreshBt.imageEdgeInsets = UIEdgeInsetsMake(0, 44, 0, 0);
    }
    return _refreshBt;
}
-(UILabel *)titile {
    if (_titile == nil) {
        _titile = [[UILabel alloc]init];
        _titile.font = [UIFont boldSystemFontOfSize:18];
        _titile.text = @"";
        _titile.textColor = UIColor.blackColor;
        _titile.textAlignment = NSTextAlignmentCenter;
        
    }
    return _titile;
}
- (void)setNaviType:(NaviType)naviType {
    switch (naviType) {
        case clos:
            _backBt.hidden = NO;
            _closeBt.hidden = YES;
            _refreshBt.hidden = YES;
            [_backBt setImage:nil forState:UIControlStateNormal];
            [_backBt setTitle:@"关闭" forState:UIControlStateNormal];
            break;
        case back:
            _backBt.hidden = NO;
            _closeBt.hidden = YES;
            _refreshBt.hidden = YES;
            [_backBt setImage:[UIImage imageNamed:@"ic_back_black"] forState:UIControlStateNormal];
            [_backBt setTitle:@"" forState:UIControlStateNormal];
         
            break;
        case finish:
            _backBt.hidden = YES;
            _closeBt.hidden = YES;
            _refreshBt.hidden = NO;
            [_refreshBt setImage:nil forState:UIControlStateNormal];
            [_refreshBt setTitle:@"完成" forState:UIControlStateNormal];
            
            break;
        default:
            break;
    }
}

-(void)backAction {
    if (self.backBlock != nil) {
        self.backBlock();
    }
}
-(void)closeAction {
    if (self.closeBlock != nil) {
        self.closeBlock();
    }
}
-(void)refreshAction {
    if (self.refreshBlock != nil) {
        self.refreshBlock();
    }
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _naviType = back;
        
        [self.backBt addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        [self.closeBt addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
        [self.refreshBt addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventTouchUpInside];
        self.backgroundColor = [OcColors shared].f5F6F9;
        
        [self addSubViews:@[self.backBt, self.closeBt, self.refreshBt, self.titile]];
        
        [self.titile mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-13);
            make.centerX.equalTo(self);
        }];
        
        [self.backBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titile);
            make.left.equalTo(self).offset(15);
            make.width.mas_equalTo(40);
        }];
       
        [self.closeBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titile);
            make.left.equalTo(self.backBt.mas_right);
            make.width.mas_equalTo(40);
        }];
       
        [self.refreshBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titile);
            make.right.equalTo(self).offset(-10);
            make.width.mas_equalTo(80);
        }];
        
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
