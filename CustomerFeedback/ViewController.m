//
//  ViewController.m
//  CustomerFeedback
//
//  Created by Dev on 7/21/17.
//  Copyright © 2017 Dev. All rights reserved.
//

#import "ViewController.h"
#import "ResultViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onVeryGood:(id)sender {
    
    [self sendEmail:@"vg"];
    [self gotoResultScreen];
}


- (IBAction)onGood:(id)sender
{
    [self sendEmail:@"g"];
    [self gotoResultScreen];
}


- (IBAction)onAverage:(id)sender
{
    [self sendEmail:@"a"];
    [self gotoResultScreen];
}

- (IBAction)onPoor:(id)sender
{
    [self sendEmail:@"p"];
    [self gotoResultScreen];
}


- (IBAction)onBad:(id)sender
{
    [self sendEmail:@"b"];
    [self gotoResultScreen];
}

-(void) gotoResultScreen
{
    ResultViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
    
    [self presentViewController:vc animated:NO completion:nil];
    
}

-(void) sendEmail:(NSString*)param
{
    NSString *url = [NSString stringWithFormat:@"http://www.play-by-ear.net/feedback/serverAPI.php?v=%@", param];
    
    NSURLSession *aSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[aSession dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (((NSHTTPURLResponse *)response).statusCode == 200) {
            if (data) {
                NSString *contentOfURL = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"%@", contentOfURL);
            }
        } else {
            NSLog(@"Error");
            
        }
    }] resume];
    
}




@end
