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
    
    [self performSelector:@selector(back) withObject:nil afterDelay:3.0f];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)back
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
