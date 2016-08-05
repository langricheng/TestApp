//
//  RotationViewController.m
//  View_Day07_CALayer
//
//  Created by tarena176 on 15-3-7.
//  Copyright (c) 2015年 tarena176. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation RotationViewController
- (IBAction)rotationY:(UIButton *)sender {
    CABasicAnimation *yx = [CABasicAnimation animationWithKeyPath:@"transform"];
    yx.fromValue = [NSValue valueWithCATransform3D:self.imageView.layer.transform];
    yx.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.imageView.layer.transform, M_PI,0,1,0)];
    yx.duration = 2.0;
    yx.delegate = self;
    [self.imageView.layer addAnimation:yx forKey:nil];
}
- (IBAction)rotaionZ:(UIButton *)sender {
    CABasicAnimation *rz = [CABasicAnimation animationWithKeyPath:@"transform"];
    rz.fromValue = [NSValue valueWithCATransform3D:self.imageView.layer.transform];
    rz.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.imageView.layer.transform, M_PI, 0,0,1)];
    rz.duration = 2.0;
    rz.delegate = self;
    [self.imageView.layer addAnimation:rz forKey:nil];
    
}
- (IBAction)rotationX:(UIButton *)sender {
    CABasicAnimation *rx = [CABasicAnimation animationWithKeyPath:@"transform"];
    rx.fromValue = [NSValue valueWithCATransform3D:self.imageView.layer.transform];
    rx.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.imageView.layer.transform, M_PI, 1,0,0)];
    rx.duration = 2.0;
    rx.delegate = self;
    [self.imageView.layer addAnimation:rx forKey:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.imageView.layer.transform = CATransform3DRotate(self.imageView.layer.transform, M_PI, 1, 1, 1);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
