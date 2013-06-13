//
//  FadeAnimationView.m
//  blog
//
//  Created by space on 13-6-9.
//  Copyright (c) 2013年 shiqiang. All rights reserved.
//

#import "FadeAnimationView.h"

@implementation FadeAnimationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.alpha = 0.0;
        self.hidden = YES;
    }
    return self;
}

-(void)hideContentView
{
    [UIView animateWithDuration:1.0 animations:^{
        self.alpha = 0.0;
    }];
    self.hidden = YES;
}

-(void)showContentView
{
    
    self.hidden = NO;
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView animateWithDuration:1.0 animations:^{
        
        self.alpha = 1.0;
    }];
    
    
}

@end
