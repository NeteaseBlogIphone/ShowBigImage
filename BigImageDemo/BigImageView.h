//
//  BigImageView.h
//  blog
//
//  Created by space on 13-6-8.
//  Copyright (c) 2013年 shiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigImageView : UIScrollView<UIScrollViewAccessibilityDelegate>
{
    UIImageView* bigImageContentView;

}



-(void)saveBigImage;
-(void)hideBigImageContentView;
-(void)showBigImageContentView:(NSString*)imgUrl;




@end
