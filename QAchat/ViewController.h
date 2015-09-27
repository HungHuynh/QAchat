//
//  ViewController.h
//  QAchat
//
//  Created by Keng on 9/26/15.
//  Copyright © 2015 HungHuynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIOSocket.h"

@interface ViewController : UIViewController

@property  SIOSocket *socket;
@property  BOOL socketIsConnected;

@end

