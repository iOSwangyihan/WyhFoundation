//
//  OcBaseNaviView.h
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/19.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    back = 0,
    clos,
    finish,
} NaviType;

typedef void(^NaviBlock)(void);
NS_ASSUME_NONNULL_BEGIN

@interface OcBaseNaviView : UIView
@property(nonatomic, assign)NaviBlock backBlock;
@property(nonatomic, assign)NaviBlock closeBlock;
@property(nonatomic, assign)NaviBlock refreshBlock;
@property(nonatomic, assign)NaviType naviType;
@property(nonatomic, strong)UIButton * backBt;
@property(nonatomic, strong)UIButton * closeBt;
@property(nonatomic, strong)UIButton * refreshBt;
@property(nonatomic, strong)UILabel * titile;
@end

NS_ASSUME_NONNULL_END
