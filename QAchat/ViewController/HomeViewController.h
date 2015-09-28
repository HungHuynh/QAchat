//
//  HomeViewController.h
//  QAchat
//
//  Created by Keng on 9/26/15.
//  Copyright © 2015 HungHuynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Define.h"
#import "AppDelegate.h"

@interface HomeViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tfdUsername;
@property (weak, nonatomic) IBOutlet UILabel *lblLogoApp;

@end
