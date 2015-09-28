//
//  AnswerViewController.m
//  QAchat
//
//  Created by Keng on 9/26/15.
//  Copyright © 2015 HungHuynh. All rights reserved.
//

#import "AnswerViewController.h"

@interface AnswerViewController ()
- (IBAction)selectDone:(id)sender;

@end

@implementation AnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)selectDone:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
