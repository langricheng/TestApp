//
//  ViewController.m
//  View_Day07_CALayer
//
//  Created by tarena176 on 15-3-7.
//  Copyright (c) 2015年 tarena176. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CALayer *layer = self.view.layer;
    layer.backgroundColor = [[UIColor redColor]CGColor];
    layer.cornerRadius = 20;
    
    
    self.imageView.layer.cornerRadius = 10;
    self.imageView.layer.masksToBounds = YES;
    //加子层
    CALayer *subLayer = [CALayer layer];
    subLayer.backgroundColor = [[UIColor blueColor]CGColor];
    subLayer.frame = CGRectMake(30,200, 200,120);
    subLayer.shadowColor = [[UIColor greenColor]CGColor];
    
    subLayer.shadowOffset = CGSizeMake(5,5);
    subLayer.shadowRadius = 5.0;
    subLayer.opacity = 0.8;
    subLayer.cornerRadius = 10.0;
    [layer addSublayer:subLayer];
    
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(30, 320, 100, 100);
    imageLayer.contents = (id)[UIImage imageNamed:@"Dennis Ritchie.png"].CGImage;
    [layer addSublayer:imageLayer];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
