//
//  AppDelegate.m
//  QAchat
//
//  Created by Keng on 9/26/15.
//  Copyright © 2015 HungHuynh. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize socket = _socket;
@synthesize arrayAnswer = _arrayAnswer;
@synthesize arrayQuestion = _arrayQuestion;
@synthesize socketIsConnected = _socketIsConnected;

@synthesize questionView = _questionView;
@synthesize answerView = _answerView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _arrayQuestion = [[NSMutableArray alloc] init];
    _arrayAnswer = [[NSMutableArray alloc] init];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _questionView = (QuestionViewController *)[storyboard instantiateViewControllerWithIdentifier:@"QuestionViewController"];
    _answerView = (AnswerViewController *)[storyboard instantiateViewControllerWithIdentifier:@"AnswerViewController"];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
}

- (void)connectSocketIO:(NSString*) username {
    [SIOSocket socketWithHost:[NSString stringWithFormat:@"%@:%@/%@",SOCKETIO_ADDR,SOCKETIO_PORT,SOCKETIO_NAMESPACE] response: ^(SIOSocket *socket)
     {
         self.socket = socket;
         
         __weak typeof(self) weakSelf = self;
         
         self.socket.onConnect = ^()
         {
             weakSelf.socketIsConnected = YES;
             NSLog(@"connected");
             
             [weakSelf.socket emit:SOCKETIO_EVENT_REGISTER args:@[[NSDictionary dictionaryWithObjects:@[username] forKeys:@[@"username"]]]];
         };
         
         self.socket.onDisconnect = ^() {
             weakSelf.socketIsConnected = NO;
             NSLog(@"disconnected");
         };
         
         self.socket.onReconnect = ^(NSInteger count) {
             NSLog(@"reconnected %ld",(long)count);
             
             //[weakSelf.socket emit:SOCKETIO_EVENT_REGISTER args:@[[NSDictionary dictionaryWithObjects:@[username] forKeys:@[@"username"]]]];
         };
         
         self.socket.onError = ^(NSDictionary* error) {
             NSLog(@"Error : %@", error);
         };
         
         [self.socket on:SOCKETIO_EVENT_RESPONSE callback: ^(SIOParameterArray *args) {
             NSString *response = [args firstObject];
             NSLog(@"my response : %@", [response valueForKey:@"data"]);
             
             //Register
             if([[response valueForKey:@"type"]  isEqual: @"Register"]) {
//                 weakSelf.window.rootViewController = _questionView;
             }
             
             if([[response valueForKey:@"type"]  isEqual: @"Question"] && [response valueForKey:@"data"] != nil) {
                 [_arrayQuestion addObject:[response valueForKey:@"data"]];
                 [_questionView.tblQuestion reloadData];
             }
         }];
         
     }];
}

- (void)selectQuestion {
    
}

@end
