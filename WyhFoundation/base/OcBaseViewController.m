//
//  OcBaseViewController.m
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/19.
//

#import "OcBaseViewController.h"

@interface OcBaseViewController ()

@end

@implementation OcBaseViewController
- (OcBaseNaviView *)navi {
    if (_navi == nil) {
        _navi = [[OcBaseNaviView alloc]init];
        
    }
    return  _navi;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [OcColors shared].f5F6F9;
    // Do any additional setup after loading the view.
    __weak OcBaseViewController * Self = self;
    self.navi.backBlock = ^() {
        [Self lefiBackActive];
    };
    self.navi.closeBlock = ^() {
        [Self closeBackActive];
    };
    self.navi.refreshBlock = ^() {
        [Self refreshBackActive];
    };
    
    [self.view addSubview:self.navi];

    [self.navi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.view);
            make.height.mas_equalTo(44 + [self statusHeight]);
        }];
}
-(void)lefiBackActive {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)closeBackActive {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)refreshBackActive {
    [self.navigationController popViewControllerAnimated:YES];
}
//状态栏高度
-(CGFloat)statusHeight {
    
    if (@available(iOS 13.0, *)) {
        return [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height;
    } else {
        return [UIApplication sharedApplication].statusBarFrame.size.height;    }
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

