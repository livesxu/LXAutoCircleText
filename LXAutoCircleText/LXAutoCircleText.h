//
//  LXAutoCircleText.h
//  LXAutoCircleText
//
//  Created by MacBook pro on 16/5/24.
//  Copyright © 2016年 FZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXAutoCircleText : UIView



//Timer Plan
+(void)autoTimerCircleText:(NSString *)text TextFont:(CGFloat)font BackgroundColor:(UIColor *)color InView:(UIView *)superView Frame:(CGRect)frame;
//Animation Plan
//+(void)autoAnimationCircleText:(NSString *)text TextFont:(CGFloat)font InView:(UIView *)superView Frame:(CGRect)frame;

@end
