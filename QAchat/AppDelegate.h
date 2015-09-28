//
//  AppDelegate.h
//  QAchat
//
//  Created by Keng on 9/26/15.
//  Copyright © 2015 HungHuynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIOSocket.h"
#import "Define.h"

#import "QuestionViewController.h"
#import "AnswerViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (retain, nonatomic) SIOSocket *socket;
@property (assign, nonatomic) BOOL socketIsConnected;

@property (retain, nonatomic) NSMutableArray *arrayQuestion;
@property (retain, nonatomic) NSMutableArray *arrayAnswer;

@property (strong, nonatomic) UIWindow *window;

@property (retain, nonatomic) QuestionViewController *questionView;
@property (retain, nonatomic) AnswerViewController *answerView;

- (void)connectSocketIO:(NSString*)username;

@end

