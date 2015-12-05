//
//  ViewController.m
//  NavigationDropView
//
//  Created by YCLZONE on 12/5/15.
//  Copyright © 2015 YCLZONE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120, 35)];
    [button  addTarget:self action:@selector(showNavigationDropView) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"xxxx" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.navigationItem.titleView = button;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showNavigationDropView {
    NSLog(@"xxxx");
}

@end
