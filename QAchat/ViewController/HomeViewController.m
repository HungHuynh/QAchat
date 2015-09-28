//
//  HomeViewController.m
//  QAchat
//
//  Created by Keng on 9/26/15.
//  Copyright © 2015 HungHuynh. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize lblLogoApp = _lblLogoApp;
@synthesize tfdUsername = _tfdUsername;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Animation for text logo app
    [UIView animateWithDuration:1.0
                     animations:^{
                         CGAffineTransform transform = CGAffineTransformMakeTranslation(0, -100);
                         _lblLogoApp.transform = transform;
                     }
                     completion:^(BOOL finished){
                         _tfdUsername.hidden = false;
                         [_tfdUsername becomeFirstResponder];
                     }];
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

#pragma mark - UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_tfdUsername resignFirstResponder];
    
    if (_tfdUsername.text.length > 0) {
        AppDelegate *appDelegate = APPDELEGATE;
        [appDelegate connectSocketIO:_tfdUsername.text];
    }
    
    return NO;
}

@end
