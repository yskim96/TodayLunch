//
//  ViewController.h
//  33
//
//  Created by Kim Young Suk on 12. 4. 2..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFHpple.h" 

@interface ViewController : UIViewController
<UIScrollViewDelegate  ,UITableViewDataSource, UITableViewDelegate>
{ 
    //UIScrollViewDelegate를 추가
    IBOutlet UITextView *eat;
    IBOutlet UITextView *eat2;
    IBOutlet UIStepper *stepper;
    IBOutlet UIScrollView *area_view;
    IBOutlet UIImageView *area_bg;
    IBOutlet UITextField *scnum;
    IBOutlet UILabel *stpnum;
    IBOutlet UILabel *ddda;
    IBOutlet UILabel *index;
    IBOutlet UILabel *today;
    IBOutlet UILabel *datee;
    IBOutlet UILabel *calme;
    IBOutlet UILabel *index_now;
    IBOutlet UILabel *scname2;
    IBOutlet UILabel *ggay;
    IBOutlet UILabel *scname22;
    IBOutlet UIImageView *hideere;
    IBOutlet UIImageView *lunch;
    IBOutlet UIImageView *dinner;
    IBOutlet UIButton *start;
    IBOutlet UIButton *area_button;
    IBOutlet UIView *view;
    IBOutlet UIActivityIndicatorView *bo;
    
}
- (IBAction)start:(UIButton *)sender;
- (IBAction)area:(UIButton *)sender;
- (IBAction)valueChanged:(UIStepper *)sender;
- (IBAction)valueTodayed:(UIButton *)sender;
- (IBAction)DIS:(id)sender;

//@property (strong, nonatomic) IBOutlet UITableView *table;

@end

