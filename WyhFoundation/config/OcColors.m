//
//  OcColors.m
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/19.
//

#import "OcColors.h"


@implementation OcColors
static OcColors * colors = nil;

- (UIColor *)ffffff {
    return Colorshex(0xffffff);
}
-(UIColor *)f5F6F9 {
    return Colorshex(0xf5F6F9);
}
+ (OcColors *)shared {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
       
        colors = [[OcColors alloc]init];
        
    });
    
    return  colors;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (colors == nil) {
        static dispatch_once_t once;
        dispatch_once(&once, ^{
            colors = [super allocWithZone:zone];
        });
    }
    return  colors;
        
}
@end
