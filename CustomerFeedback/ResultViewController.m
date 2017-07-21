//
//  ResultViewController.m
//  CustomerFeedback
//
//  Created by Dev on 7/21/17.
//  Copyright © 2017 Dev. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [NSTimer scheduledTimerWithTimeInterval:3.0f repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
