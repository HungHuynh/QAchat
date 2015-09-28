//
//  Define.h
//  QAchat
//
//  Created by Keng on 9/27/15.
//  Copyright © 2015 HungHuynh. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define APPDELEGATE                     (AppDelegate*)[[UIApplication sharedApplication] delegate]

#define SOCKETIO_ADDR                   @"http://localhost"
#define SOCKETIO_PORT                   @"5000"
#define SOCKETIO_NAMESPACE              @"QAchat"

#define SOCKETIO_EVENT_CONNECT          @"connect"
#define SOCKETIO_EVENT_DISCONNECT       @"disconnect request"
#define SOCKETIO_EVENT_REGISTER         @"register"
#define SOCKETIO_EVENT_QUESTION         @"question"
#define SOCKETIO_EVENT_JOIN             @"join"
#define SOCKETIO_EVENT_LEAVE            @"leave"
#define SOCKETIO_EVENT_CLOSE            @"close"
#define SOCKETIO_EVENT_ANSWER           @"answer"
#define SOCKETIO_EVENT_RESPONSE         @"my response"

#endif /* Define_h */
