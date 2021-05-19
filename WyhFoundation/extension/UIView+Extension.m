//
//  UIView+Extension.m
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/19.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
-(void)addSubViews:(NSArray<UIView*> *)views {
    for (UIView * v in views) {
        [self addSubview:v];
    }
}
@end
