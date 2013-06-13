//
//  BigImageContentView.m
//  blog
//
//  Created by space on 13-6-9.
//  Copyright (c) 2013年 shiqiang. All rights reserved.
//

#import "BigImageContentView.h"
#define UISCREEN_WIDTH          320
#define UISCREEN_HEIGHT         ([[UIScreen mainScreen] bounds].size.height)
#define IMAGE_SAVE_IMAGE @"下载图片按钮@2x.png"
#define IMAGE_SAVE_IMAGE_HOVER @"下载图片按钮hover@2x.png"
@interface BigImageContentView ()
{
    UIButton* saveImgButton;

}

@end


@implementation BigImageContentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.bigImageView = [[BigImageView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_HEIGHT - 20)];
        [self addSubview:self.bigImageView];
        
        saveImgButton = [[UIButton alloc] initWithFrame:CGRectMake(140, UISCREEN_HEIGHT - 20 - 40 - 28, 40, 28)];
        [saveImgButton setImage:[UIImage imageNamed:IMAGE_SAVE_IMAGE] forState:UIControlStateNormal];
        [saveImgButton setImage:[UIImage imageNamed:IMAGE_SAVE_IMAGE_HOVER] forState:UIControlStateHighlighted];
        
        [saveImgButton addTarget:self action:@selector(saveBigImage) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:saveImgButton];
        
        UITapGestureRecognizer* hideTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideBigImageContentView)];
        [self addGestureRecognizer:hideTap];

    }
    return self;
}

//保存图片
-(void)saveBigImage
{
    [self.bigImageView saveBigImage];
}

-(void)hideBigImageContentView
{
    [self.bigImageView hideBigImageContentView];
    [super hideContentView ];
}

-(void)showBigImageContentView:(NSString*)imgUrl
{
    [self.bigImageView showBigImageContentView:imgUrl];
    [super showContentView];
}

@end
