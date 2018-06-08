//
//  GCDVCViewController.m
//  OC_Thread
//	https://images2.962360.com/images/201404/thumb_img/23199_thumb_P_1398652234236.jpg
//  Created by 薛坤龙 on 2018/5/29.
//  Copyright © 2018年 Game. All rights reserved.
//

#import "GCDVCViewController.h"

@interface GCDVCViewController ()

@end

@implementation GCDVCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.navigationItem.title = @"GCD";
	
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	
	[self sync_serial];
	
//	[self gcdGroup];
	
}



- (void)sync_serial
{
	
	dispatch_queue_t serialQueue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
	
	dispatch_sync(serialQueue, ^{
		
		NSLog(@"1:1");
		NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://images2.962360.com/images/201404/thumb_img/23199_thumb_P_1398652234236.jpg"]];
		[NSThread sleepForTimeInterval:3];
		NSLog(@"1:2");
	});
	
	dispatch_sync(serialQueue, ^{
		
		NSLog(@"2:1");
		NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://images2.962360.com/images/201404/thumb_img/23199_thumb_P_1398652234236.jpg"]];
		[NSThread sleepForTimeInterval:3];
		
		NSLog(@"2:2");
		
	});
	
}


/**
 并行异步网络请求   监听多个网络请求结果后  刷新UI
 
 	使用
 	dispatch_group_enter
 	dispatch_group_leave
 
 */
- (void)gcdGroup
{
	dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
	dispatch_group_t group = dispatch_group_create();
	
	dispatch_group_enter(group);
	dispatch_group_async(group, queue, ^{
		
		NSLog(@"1:1");
		NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://images2.962360.com/images/201404/thumb_img/23199_thumb_P_1398652234236.jpg"]];
		NSLog(@"11 %@",[NSThread currentThread]);
		
		
		dispatch_group_leave(group);
		
	});
	
	dispatch_group_enter(group);
	dispatch_group_async(group, queue, ^{
		
		NSLog(@"2:22");
		NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://images2.962360.com/images/201404/thumb_img/23199_thumb_P_1398652234236.jpg"]];
		NSLog(@"22 %@",[NSThread currentThread]);
		
		dispatch_group_leave(group);

		
	});
	
	dispatch_group_notify(group, queue, ^{
		
		//回到主线程
		dispatch_async(dispatch_get_main_queue(), ^{
			
			NSLog(@"刷新UI");
			
		});
		
	});

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
