//
//  ViewController.m
//  OC_Thread
//
//  Created by 薛坤龙 on 2018/5/29.
//  Copyright © 2018年 Game. All rights reserved.
//

#import "ViewController.h"
#import "GCDVCViewController.h"
#import "OperationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.view.backgroundColor = [UIColor whiteColor];
	self.navigationItem.title = @"线程";
	
	UIButton *gcdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	[gcdBtn setTitle:@"GCD" forState:UIControlStateNormal];
	[gcdBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	gcdBtn.frame = CGRectMake((self.view.frame.size.width-100)/2, 200, 100, 46);
	[gcdBtn addTarget:self action:@selector(gcdEvent:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:gcdBtn];
	
	UIButton *opBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	[opBtn setTitle:@"NSOperation" forState:UIControlStateNormal];
	[opBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	opBtn.frame = CGRectMake((self.view.frame.size.width-200)/2, 300, 200, 46);
	[opBtn addTarget:self action:@selector(opEvent:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:opBtn];
	
	
}

///Op
- (void)opEvent:(UIButton *)sender
{
	
	OperationViewController *vc = [[OperationViewController alloc] init];
	[self.navigationController pushViewController:vc animated:YES];
	
}


///GCD
- (void)gcdEvent:(UIButton *)sender
{
	GCDVCViewController *vc = [[GCDVCViewController alloc] init];
	[self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
