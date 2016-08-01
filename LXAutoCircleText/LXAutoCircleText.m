//
//  LXAutoCircleText.m
//  LXAutoCircleText
//
//  Created by MacBook pro on 16/5/24.
//  Copyright © 2016年 FZ. All rights reserved.
//

#import "LXAutoCircleText.h"

void AnimationPlan(UIView *view,CGFloat XOffset,NSTimeInterval duration){
    
    CAKeyframeAnimation *keyAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    CGPoint pS=CGPointMake(0, 0);
    CGPoint pE=CGPointMake(-XOffset, 0);
    
    
    keyAnimation.values=@[[NSValue valueWithCGPoint:pS],
                          [NSValue valueWithCGPoint:pE]
                          ];
    keyAnimation.duration=duration;
    
    keyAnimation.repeatCount=CGFLOAT_MAX;
    
    [view.layer addAnimation:keyAnimation forKey:nil];
    
}
void AnimationPlanTemp(UIView *view,CGFloat XOffset,NSTimeInterval duration){
    
    CAKeyframeAnimation *keyAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    CGPoint pS=CGPointMake(XOffset, 0);
    CGPoint pE=CGPointMake(0, 0);
    
    
    keyAnimation.values=@[[NSValue valueWithCGPoint:pS],
                          [NSValue valueWithCGPoint:pE]
                          ];
    keyAnimation.duration=duration;
    
    keyAnimation.repeatCount=CGFLOAT_MAX;
    
    [view.layer addAnimation:keyAnimation forKey:nil];
    
}

@interface LXAutoCircleText ()<UIScrollViewDelegate>

@property(nonatomic,assign)CGFloat widthText;
@property(nonatomic,strong)UILabel *textLabel;
@property(nonatomic,strong)UIScrollView *srcView;

@property (nonatomic, strong) dispatch_source_t timer;

@end



@implementation LXAutoCircleText

+(void)autoTimerCircleText:(NSString *)text TextFont:(CGFloat)font BackgroundColor:(UIColor *)color InView:(UIView *)superView Frame:(CGRect)frame;{
    LXAutoCircleText *autoCT=[[LXAutoCircleText alloc]initWithFrame:frame Text:text TextFont:font WithTimer:YES];
    autoCT.backgroundColor=color;
    [superView addSubview:autoCT];
   
}

//+(void)autoAnimationCircleText:(NSString *)text TextFont:(CGFloat)font InView:(UIView *)superView Frame:(CGRect)frame;{
//    
//    LXAutoCircleText *autoCT=[[LXAutoCircleText alloc]initWithFrame:frame Text:text TextFont:font WithTimer:NO];
//    autoCT.backgroundColor=[UIColor redColor];
//    [superView addSubview:autoCT];
//    
//}

-(instancetype)initWithFrame:(CGRect)frame Text:(NSString *)text TextFont:(CGFloat)font WithTimer:(BOOL)isTimer{
    
    if ([super initWithFrame:frame]) {
        
        NSString *newText=[NSString stringWithFormat:@"%@   ",text];
        
        CGSize textSize=[newText boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
        self.widthText=textSize.width;
        
        if (_widthText > frame.size.width) {
            
            _textLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, _widthText *2, frame.size.height)];
            _textLabel.font=[UIFont systemFontOfSize:font];
            
            _textLabel.text=[NSString stringWithFormat:@"%@   %@",text,text];
        
           if (isTimer) {
               _srcView=[[UIScrollView alloc]initWithFrame:self.bounds];
               _srcView.contentSize=CGSizeMake(_widthText, frame.size.height);
               _srcView.delegate=self;
               _srcView.showsHorizontalScrollIndicator=NO;
               
               [self addSubview:_srcView];
               [_srcView addSubview:_textLabel];
            
               [self timerAction];
           }
        }
        else{
            _textLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, _widthText, frame.size.height)];
            _textLabel.font=[UIFont systemFontOfSize:font];
            
            _textLabel.text=text;
            
            [self addSubview:_textLabel];
        }
    }
    return self;
}

-(void)timerAction{
    
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
        dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, .01 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
        dispatch_source_set_event_handler(_timer, ^{
            
            CGFloat  XOffset =_srcView.contentOffset.x;
            
            _srcView.contentOffset=CGPointMake(XOffset +.2, 0);
        });
        dispatch_resume(_timer);
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x > _widthText) {
        scrollView.contentOffset=CGPointMake(0, 0);
    }
    
}

@end
