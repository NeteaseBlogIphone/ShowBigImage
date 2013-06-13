//
//  BigImageContentView.h
//  blog
//
//  Created by space on 13-6-9.
//  Copyright (c) 2013年 shiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BigImageView.h"
#import "FadeAnimationView.h"

@interface BigImageContentView : FadeAnimationView

@property (nonatomic,strong) BigImageView* bigImageView;

-(void)hideBigImageContentView;
-(void)showBigImageContentView:(NSString*)imgUrl;

@end
