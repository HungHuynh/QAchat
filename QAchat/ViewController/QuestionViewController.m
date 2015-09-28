//
//  QuestionViewController.m
//  QAchat
//
//  Created by Keng on 9/26/15.
//  Copyright © 2015 HungHuynh. All rights reserved.
//

#import "QuestionViewController.h"
#import "AppDelegate.h"

@interface QuestionViewController ()

- (IBAction)selectAddQuestion:(id)sender;

@end

@implementation QuestionViewController

@synthesize tblQuestion = _tblQuestion;
@synthesize tfdQuestion = _tfdQuestion;

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

- (IBAction)selectAddQuestion:(id)sender {
    _tfdQuestion.hidden = false;
    _tblQuestion.hidden = true;
}

#pragma mark - UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_tfdQuestion resignFirstResponder];
    
    //Send question to SocketIO backend :
    AppDelegate *appDelegate = APPDELEGATE;
    if( appDelegate.socketIsConnected ) {
        [appDelegate.socket emit:SOCKETIO_EVENT_QUESTION args:@[[NSDictionary dictionaryWithObjects:@[_tfdQuestion.text] forKeys:@[@"data"]]]];
    }
    
    
    _tfdQuestion.text = @"";
    _tfdQuestion.hidden = true;
    _tblQuestion.hidden = false;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AnswerViewController *answerView = (AnswerViewController *)[storyboard instantiateViewControllerWithIdentifier:@"AnswerViewController"];
    [self.navigationController pushViewController:answerView animated:true];
    
    //[self presentViewController:answerView animated:false completion:nil];
    return NO;
}

#pragma mark - Hiden foot tableview
-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0;
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - UITableView Datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    AppDelegate *appDelegate = APPDELEGATE;
    return appDelegate.arrayQuestion.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}


#pragma mark - UITableView Delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"QuestionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if( cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }
    
    AppDelegate *appDelegate = APPDELEGATE;
    cell.textLabel.text = [appDelegate.arrayQuestion objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AnswerViewController *answerView = (AnswerViewController *)[storyboard instantiateViewControllerWithIdentifier:@"AnswerViewController"];
    [self.navigationController pushViewController:answerView animated:true];
}

@end
