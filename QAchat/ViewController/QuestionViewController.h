//
//  QuestionViewController.h
//  QAchat
//
//  Created by Keng on 9/26/15.
//  Copyright © 2015 HungHuynh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UINavigationBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblQuestion;
@property (weak, nonatomic) IBOutlet UITextField *tfdQuestion;
@end
