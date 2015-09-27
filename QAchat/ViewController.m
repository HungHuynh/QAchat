//
//  ViewController.m
//  QAchat
//
//  Created by Keng on 9/26/15.
//  Copyright © 2015 HungHuynh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [SIOSocket socketWithHost: @"http://localhost:5000/test" response: ^(SIOSocket *socket)
     {
         self.socket = socket;
         
         __weak typeof(self) weakSelf = self;
         self.socket.onConnect = ^()
         {
             weakSelf.socketIsConnected = YES;
             NSLog(@"connected");
             
             [weakSelf.socket emit:@"my broadcast event" args:@[[NSDictionary dictionaryWithObjects:@[@"Hello"] forKeys:@[@"data"]]]];
         };
         
         self.socket.onDisconnect = ^() {
             NSLog(@"disconnected");
         };
         
         self.socket.onError = ^(NSDictionary* error) {
             NSLog(@"Error : %@", error);
         };
         
         [self.socket on: @"my response" callback: ^(SIOParameterArray *args) {
             NSString *response = [args firstObject];
              NSLog(@"my response : %@", response);
         }];
         
        
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
