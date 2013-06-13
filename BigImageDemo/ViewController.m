//
//  ViewController.m
//  BigImageDemo
//
//  Created by space on 13-6-13.
//  Copyright (c) 2013年 space. All rights reserved.
//

#import "ViewController.h"
#import "BigImageContentView.h"

#define UISCREEN_WIDTH          320
#define UISCREEN_HEIGHT         ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()
{
    BigImageContentView* bigImgView;

}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    bigImgView = [[BigImageContentView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_HEIGHT)];
    [self.view addSubview:bigImgView];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)show:(id)sender
{
    NSString* imageUrl = @"风景.jpg";

    [bigImgView showBigImageContentView:imageUrl];

}
@end
