//
//  ViewController.m
//  ZLUikitTest
//
//  Created by zhulin on 2018/5/21.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import "ViewController.h"

static const CGFloat topSpace = 64;
static const CGFloat kMargin = 20;

static const CGFloat kTopViewHeight = 44;
static const CGFloat kTopViewWidth = 300;

static const CGFloat kTextLabelWidth = 200;
static const CGFloat kTextLabelHeight = 30;

static const CGFloat kTopSpace = 30;

@interface ViewController ()
@property (nonatomic, strong) NSArray * plist;
@property (nonatomic, assign) int index;
@property (nonatomic, strong) UIImageView * zlImageView;
@property (nonatomic, strong) UIButton * pre;
@property (nonatomic, strong) UIButton * next;
@property (nonatomic, strong) UIButton * play;
@property (nonatomic, strong) UILabel * viewTitle;
@property (nonatomic, strong) UILabel * viewContents;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //normal view test code
    {
        CGRect redFrame = CGRectMake(10, 10, 100, 100);
        UIView *redView = [[UIView alloc] initWithFrame:redFrame];
        redView.backgroundColor = [UIColor redColor];
        
        redView.contentMode = UIViewContentModeScaleToFill;
        
        CGRect blueFrame = CGRectMake(10, 150, 100, 100);
        UIView *blueView = [[UIView alloc] initWithFrame:blueFrame];
        blueView.backgroundColor = [UIColor blueColor];
        
        blueView.contentMode =UIViewContentModeTop;
        
        // Add the square views to the window
        //[self.view addSubview:redView];
        //[self.view addSubview:blueView];
    }
    //Autoresizing testing code
    {
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(kMargin, topSpace, kTopViewWidth, kTopViewHeight)];
        CGFloat textLabelTop = (topView.frame.size.width - kTextLabelWidth) / 2;
        CGFloat textLabelWidth = (topView.frame.size.height - kTextLabelHeight) / 2;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(textLabelTop, textLabelWidth, kTextLabelWidth, kTextLabelHeight)];
        
        [textLabel setText:@"Garvey"];
        [textLabel setTextAlignment:NSTextAlignmentCenter];
        
        [topView setBackgroundColor:[UIColor redColor]];
        [textLabel setTextColor:[UIColor whiteColor]];
        textLabel.backgroundColor = [UIColor greenColor];
        
        [textLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
        // 设置View控件的宽度按照父视图的比例进行缩放，距离父视图顶部、左边距和右边距的距离不变
        [topView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin];
        
        
        [topView addSubview:textLabel];
        [self.view addSubview:topView];
        
        // 注意：重新设置topView位置的代码，必须要写在添加视图的后面。
        CGFloat topViewWidth =  [UIScreen mainScreen].bounds.size.width - kMargin * 2;
        [topView setFrame:CGRectMake(kMargin, kTopSpace, topViewWidth, kTopViewHeight)];
    }
    
    //UIViewContentMode test code
    {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kMargin , topSpace + 100, kTopViewWidth, kTopViewHeight)];

        
        imageView.image = [UIImage imageNamed:@"greenMan001"];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.borderWidth = 1;
        [self.view addSubview:imageView];
    }
    //UIbutton test code
    {
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(kMargin , topSpace + 200, kTopViewWidth, kTopViewHeight)];
        
        button.titleLabel.font = [UIFont systemFontOfSize:20];
        
        [button setTitleShadowColor:[UIColor yellowColor] forState:UIControlStateNormal];
        
        [button setTitle:@"zlunique" forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        //[button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        button.showsTouchWhenHighlighted = YES;
        
        [button setBackgroundImage:[UIImage imageNamed:@"greenMan001"] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
    }
    //UIImageView animation test code
    {
        self.zlImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kMargin , topSpace + 400, kTopViewWidth, kTopViewHeight)];
        
        self.pre =[[UIButton alloc] initWithFrame:CGRectMake(kMargin , topSpace + 450, 40, kTopViewHeight)];
        self.next =[[UIButton alloc] initWithFrame:CGRectMake(kMargin + kTopViewWidth - 40 , topSpace + 450, 40, kTopViewHeight)];
        
        self.play =[[UIButton alloc] initWithFrame:CGRectMake(kMargin + (kTopViewWidth - 40)/2 , topSpace + 450, 40, kTopViewHeight)];
        
        self.zlImageView.backgroundColor = [UIColor orangeColor];
        
        self.pre.backgroundColor = [UIColor redColor];
        self.next.backgroundColor = [UIColor greenColor];
        self.play.backgroundColor = [UIColor purpleColor];
        
        [self.pre setTitle:@"pre" forState:UIControlStateNormal];
        [self.next setTitle:@"next" forState:UIControlStateNormal];
        [self.play setTitle:@"play" forState:UIControlStateNormal];

        
        [self.pre setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.next setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.play setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        [self.pre addTarget:self action:@selector(preButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.next addTarget:self action:@selector(nextButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.play addTarget:self action:@selector(playButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:self.zlImageView];
        [self.view addSubview:self.pre];
        [self.view addSubview:self.next];
        [self.view addSubview:self.play];
        
        NSBundle *mainbundle = [NSBundle mainBundle];
        NSString *pathPlist = [mainbundle pathForResource:@"image.plist" ofType:nil];
        self.plist = [NSArray arrayWithContentsOfFile:pathPlist];
        
       for (NSDictionary * dic in self.plist)
       {
           NSLog(@"plist:%@",dic);
       }
        
        self.index = 1;
        [self changeMovie];
        
    }
    
}
- (void)buttonAction:(UIButton *)sender
{
    NSLog(@"this button pressed");
    if ([sender.titleLabel.text isEqualToString:@"uniquezl"])
    {
        [sender setTitle:@"zlunique" forState:UIControlStateNormal];
    }
    else
    {
        [sender setTitle:@"uniquezl" forState:UIControlStateNormal];
    }
    
}
//
- (void)changeMovie
{
    self.zlImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@001",self.plist[self.index - 1][@"icon"]]];
    self.viewTitle.text = [NSString stringWithFormat:@"%d/%lu",self.index,self.plist.count];
    self.viewContents.text = self.plist[self.index - 1][@"desc"];
}
- (void)preButtonAction
{
    self.index--;
    if ([self.zlImageView isAnimating])
    {
        [self.zlImageView stopAnimating];
    }
    [self changeMovie];
}
- (void)nextButtonAction
{
    self.index++;
    if ([self.zlImageView isAnimating])
    {
        [self.zlImageView stopAnimating];
    }
    [self changeMovie];
}
-(void) playButtonAction
{
    if ([self.zlImageView isAnimating]) {
        return;
    }
    if (self.index == 1)
    {
        self.pre.enabled = NO;
    }
    else if (self.index == self.plist.count)
    {
        self.next.enabled = NO;
    }
    else
    {
        self.pre.enabled = YES;
        self.next.enabled = YES;
    }
    int i = 1;
    NSMutableArray * currentArray = [NSMutableArray array];
    while(1){
        NSString *imageName = [NSString stringWithFormat:@"%@%03d.png",self.plist[self.index - 1][@"icon"],i];
//        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        
        UIImage *image = [UIImage imageNamed:imageName];
        if (image)
        {
            [currentArray addObject:image];
            i++;
        }
        else{
            break;
        }
    }
    self.zlImageView.animationImages = currentArray;
    self.zlImageView.animationDuration = (i-1)*0.1;
    self.zlImageView.animationRepeatCount = 1;
    [self.zlImageView startAnimating];
    [self performSelector:@selector(cleanImage) withObject:nil afterDelay:(i-1)*0.1];
}
- (void)cleanImage{
    self.zlImageView.animationImages = nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
