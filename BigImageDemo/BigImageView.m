//
//  BigImageView.m
//  blog
//
//  Created by space on 13-6-8.
//  Copyright (c) 2013年 shiqiang. All rights reserved.
//

#import "BigImageView.h"
#import "SVProgressHUD.h"


#define UISCREEN_WIDTH          320
#define UISCREEN_HEIGHT         ([[UIScreen mainScreen] bounds].size.height)

@implementation BigImageView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor blackColor];
        bigImageContentView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_HEIGHT - 20)];
        
        bigImageContentView.backgroundColor = [UIColor blackColor];
        bigImageContentView.userInteractionEnabled = YES;
        bigImageContentView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:bigImageContentView];

        self.minimumZoomScale = 0.3;
        self.maximumZoomScale = 5.0;
        self.delegate = self;
    }
    return self;
}




//保存图片
-(void)saveBigImage
{
    UIImageWriteToSavedPhotosAlbum([bigImageContentView image],self,@selector(image:didFinishSavingWithError:contextInfo:),nil);
    [SVProgressHUD showWithStatus:@"图片存储中。。"];
}

- (void)                      image: (UIImage *) image
           didFinishSavingWithError: (NSError *) error
                        contextInfo: (void *) contextInfo
{
    if (error != nil)
    {
        [SVProgressHUD showSuccessWithStatus:@"图片存储失败"];

    }
    else
    {
        [SVProgressHUD showSuccessWithStatus:@"图片存储完成"];

    }
}

//
-(void)hideBigImageContentView
{

}

-(void)showBigImageContentView:(NSString*)imgUrl
{
//    NSURL *url = [NSURL URLWithString:imgUrl];
    
    [bigImageContentView setImage:[UIImage imageNamed:imgUrl]];
    
    [self setZoomScale:1.0];
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView

{
    return bigImageContentView; //返回ScrollView上添加的需要缩放的视图
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView

{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    bigImageContentView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                            scrollView.contentSize.height * 0.5 + offsetY);
}

//缩放结束后被调用
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale

{
    
}
@end
