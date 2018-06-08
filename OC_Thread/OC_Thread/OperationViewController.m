//
//  OperationViewController.m
//  OC_Thread
//
//  Created by 薛坤龙 on 2018/5/30.
//  Copyright © 2018年 Game. All rights reserved.
//

#import "OperationViewController.h"
//#import <AFNetworking/AFNetworking.h>
#import "AFNetworking/AFNetworking.h"

@interface OperationViewController ()

@end

@implementation OperationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.navigationItem.title = @"NSOperation";
	self.view.backgroundColor = [UIColor whiteColor];
	
//	[self opration1];
	
	[self setMaxConcurrentOperationCount];
	
}

- (void)opration1
{
	NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
	
		NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://images2.962360.com/images/201404/thumb_img/23199_thumb_P_1398652234236.jpg"]];
//		NSLog(@"%@",data);
		NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
		
	}];
	
	[op1 start];///没有加入到队列当中需要自动启动
}

/**
 * 设置 MaxConcurrentOperationCount（最大并发操作数）
 */
- (void)setMaxConcurrentOperationCount {
	
	// 1.创建队列
	NSOperationQueue *queue = [[NSOperationQueue alloc] init];
	
	// 2.设置最大并发操作数
//	queue.maxConcurrentOperationCount = 1; // 串行队列
	 queue.maxConcurrentOperationCount = 2; // 并发队列
	// queue.maxConcurrentOperationCount = 8; // 并发队列
	
	// 3.添加操作
	[queue addOperationWithBlock:^{
		
		for (int i = 0; i < 2; i++)
		{
			[NSThread sleepForTimeInterval:2]; // 模拟耗时操作
			NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
		}
		
	}];
	
	[queue addOperationWithBlock:^{
		
		for (int i = 0; i < 2; i++)
		{
			[NSThread sleepForTimeInterval:2]; // 模拟耗时操作
			NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
		}
	}];
	
	[queue addOperationWithBlock:^{
		
		for (int i = 0; i < 2; i++)
		{
			[NSThread sleepForTimeInterval:2]; // 模拟耗时操作
			NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
		}
	}];
	
	[queue addOperationWithBlock:^{
		
		for (int i = 0; i < 2; i++)
		{
			[NSThread sleepForTimeInterval:2]; // 模拟耗时操作
			NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
		}
	}];
	
	[queue addOperationWithBlock:^{
		
		for (int i = 0; i < 2; i++)
		{
			[NSThread sleepForTimeInterval:2]; // 模拟耗时操作
			NSLog(@"4---%@", [NSThread currentThread]); // 打印当前线程
		}
	}];
}

#pragma mark - 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}



@end
