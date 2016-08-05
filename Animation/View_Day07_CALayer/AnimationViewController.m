//
//  AnimationViewController.m
//  View_Day07_CALayer
//
//  Created by tarena176 on 15-3-7.
//  Copyright (c) 2015年 tarena176. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation AnimationViewController

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
    UIBezierPath *path = [UIBezierPath bezierPath];
    [self creatPath:path];
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.path = path.CGPath;
   // keyAnimation.duration = 2.0;
   // [self.imageView.layer addAnimation:keyAnimation forKey:nil];
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @1.0;
    alphaAnimation.toValue = @0.5;
   // alphaAnimation.duration = 2.0;
   // [self.imageView.layer addAnimation:alphaAnimation forKey:nil];
    
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1,0.1,0.1)];
   // transformAnimation.duration = 2.0;
    //[self.imageView.layer addAnimation:transformAnimation forKey:nil];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 2.0;
    group.animations = @[keyAnimation,alphaAnimation,transformAnimation];
    group.delegate = self;
    [self.imageView.layer addAnimation:group forKey:nil];
    
    // Do any additional setup after loading the view.
}
- (void)creatPath:(UIBezierPath*)path{
    [path moveToPoint:self.imageView.center];
    CGPoint controlPoint1 = CGPointMake(self.view.bounds.size.width-20-self.imageView.frame.size.width/2,20+self.imageView.frame.size.height/2);
    CGPoint constPoint2 = CGPointMake(20+self.imageView.frame.size.width/2, self.view.bounds.size.height-20-self.imageView.frame.size.height);
    CGPoint lastPoint = CGPointMake(self.view.bounds.size.width-20-self.imageView.frame.size.width/2, self.view.bounds.size.height-20-self.imageView.frame.size.height/2);
    [path addCurveToPoint:lastPoint controlPoint1:controlPoint1 controlPoint2:constPoint2];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.imageView removeFromSuperview];
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
