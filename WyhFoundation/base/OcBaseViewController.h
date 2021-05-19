//
//  OcBaseViewController.h
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/19.
//

#import <UIKit/UIKit.h>
#import "OcBaseNaviView.h"

NS_ASSUME_NONNULL_BEGIN

@interface OcBaseViewController : UIViewController
@property(nonatomic, strong)OcBaseNaviView * navi;
-(void)lefiBackActive;
-(void)closeBackActive;
-(void)refreshBackActive;
@end

NS_ASSUME_NONNULL_END
