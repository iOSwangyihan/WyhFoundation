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
@property(nonatomic, strong)NaviBlock backBlock;
@property(nonatomic, strong)NaviBlock closeBlock;
@property(nonatomic, strong)NaviBlock refreshBlock;
@property(nonatomic, assign)NaviType naviType;
@property(nonatomic, strong)UIButton * backBt;
@property(nonatomic, strong)UIButton * closeBt;
@property(nonatomic, strong)UIButton * refreshBt;
@property(nonatomic, strong)UILabel * titile;
- (void)setNaviType:(NaviType)naviType;
@end

NS_ASSUME_NONNULL_END
