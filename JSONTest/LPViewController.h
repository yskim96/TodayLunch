//
//  LPViewController.h
//  JSONTest
//
//  Created by Park Lambert on 11. 10. 20..
//  Copyright (c) 2011년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITextField *sc_find_text;
}
@property (strong, nonatomic) IBOutlet UITableView *table;
- (IBAction)start:(id)sender;
- (IBAction)DIS:(UIButton *)sender;
- (IBAction)sex:(id)sender;
@property (nonatomic, retain) IBOutlet UITextField *sc_find_text;
@end
