//
//  SSSettingViewController.m
//  WW
//
//  Created by ssyzh on 2017/7/15.
//  Copyright © 2017年 ssyzh. All rights reserved.
//

#import "SSSettingViewController.h"

@interface SSSettingViewController ()
@property (strong, nonatomic) UITextField *la;
@property (strong, nonatomic) UITextField *lo;
@end

@implementation SSSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *la1 = [[UILabel alloc]initWithFrame:CGRectMake(30, 100, 40, 25)];
    la1.text = @"经度";
    [self.view addSubview:la1];
    self.la = [[UITextField alloc]initWithFrame:CGRectMake(80, 100, 150, 25)];
    self.la.placeholder = @"默认经度 30.545008";
    self.la.text = @"30.545008";
    self.la.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.la];
    
    UILabel *la2 = [[UILabel alloc]initWithFrame:CGRectMake(30, 150, 40, 25)];
    la2.text = @"经度";
    [self.view addSubview:la2];
    self.lo = [[UITextField alloc]initWithFrame:CGRectMake(80, 150, 150, 25)];
    self.lo.placeholder = @"默认纬度 104.066300";
    self.lo.text = @"104.066300";
    self.lo.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.lo];
    
    double latitude = [[NSUserDefaults standardUserDefaults] doubleForKey:@"pilgrimLatitude"];
    double longitude = [[NSUserDefaults standardUserDefaults] doubleForKey:@"pilgrimLongitude"];
    self.la.text = [NSString stringWithFormat:@"%f",latitude];
    self.lo.text = [NSString stringWithFormat:@"%f",longitude];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"save" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 200, 50, 30);
    btn.backgroundColor = [UIColor lightGrayColor];
    btn.layer.cornerRadius = 5;
    [btn addTarget:self action:@selector(save) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
}
- (void)save{
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([self.la.text doubleValue] != 0.0) {
        [user setDouble:[self.la.text doubleValue] forKey:@"pilgrimLatitude"];
    }
    if ([self.lo.text doubleValue] != 0.0) {
        [user setDouble:[self.lo.text doubleValue] forKey:@"pilgrimLongitude"];
    }
    [user synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
