//
//  ViewController.m
//  33
//
//  Created by Kim Young Suk on 12. 4. 2..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//  Develop For You
//
/*

유지보수가 어렵게 코딩하는법에 준수하여 코딩되었음을 알려드립니다.

*/
#import "QuartzCore/QuartzCore.h"
#import "ViewController.h"
#import "TFHpple.h"
#define KEY_NAME      @"1"    // 아이디(스트링 or 링크)
#define KEY_CODE   @"2"    // 게시물 타이틀
#define MY_BANNER_UNIT_ID   @"a14f7af8ce72f34"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@interface ViewController ()

@end

@implementation ViewController



-(void)blank
{
    @try{{
        
        NSString *sctext= [[NSUserDefaults standardUserDefaults]stringForKey:@"SC_NUM"];
        NSString *areacode= [[NSUserDefaults standardUserDefaults]stringForKey:@"SC_area"];
        NSString *post = [NSString stringWithFormat:@"?schYm="];
        NSString *post1 = [NSString stringWithFormat:@"?schulCode=%@",sctext];
        NSString *url = [[NSString alloc] initWithFormat:@"http://hes.%@.kr/sts_sci_md00_001.do",areacode];
        NSString *realurl = [NSString stringWithFormat:@"%@%@&schulCrseScCode=4&%@",url,post1,post];
        NSString *_URL = [[NSString stringWithContentsOfURL:
                           [NSURL URLWithString:realurl]encoding:NSUTF8StringEncoding error:nil]
                          stringByReplacingOccurrencesOfString:@"<br />" withString:@"\n"];
        
        NSData *htmlData = [_URL dataUsingEncoding:NSUTF8StringEncoding];

        
        if (htmlData != nil) {
            
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
            
            
            NSArray *parserArray = [xpathParser searchWithXPathQuery:@"//div[@id='pasContentsRight']/div[@class='boardArea4']/table[@class='tableType2']/tbody/tr/td"];
            
            int id;
            int count;
            int num;
            
            count = 0;
            
            num = 8;
            
            for (id = 0; id < num; id = id + 1)
            {
                //TFHppleElement *emptyy = [parserArray objectAtIndex:0];
                TFHppleElement *dele = [parserArray objectAtIndex:id];
                
               // NSString *empty2 = NULL;
                NSString *empty1 = [dele content];
                
                NSString *empty = @"";
               // NSLog(@"%@ㅋ", empty2);

                //NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"1"];
                //empty = [[empty componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];
     
                if ([empty1 isEqualToString:empty])
                { 
                    
                    count = count + 1;
                    
                    //NSLog(@"%d", count);
                    
                }
        else{
            
        
            if(empty1 == NULL){
                
                
            count = count + 1;
                
                
            }
        }
        
    }
            NSString *SCname= [[NSUserDefaults standardUserDefaults]stringForKey:@"SC_Name_"];
            NSLog(@"[급식조회]%@ (model : %@, name : %@, systemName : %@, systemVersion : %@)" ,SCname,
                  [[UIDevice currentDevice] model],
                  [[UIDevice currentDevice] name],
                  [[UIDevice currentDevice] systemName],
                  [[UIDevice currentDevice] systemVersion]);
            [today setText:[NSString stringWithFormat:@"%d",count]];
        }
        else {
          
        }

    }
    }
    
    @catch (NSException *e) {
        
    }


    @finally {
    
    }
}
-(void)UseOfHpple
{
    
    @try{
   
    NSDate* sourceDate = [NSDate date];
    
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    NSTimeZone* destinationTimeZone = [NSTimeZone systemTimeZone];
    
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:sourceDate];
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:sourceDate];
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    
    NSDate* destinationDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:sourceDate];
    
    NSString *strDate = [[NSString alloc] initWithFormat:@"%@",destinationDate];
    NSArray *arr = [strDate componentsSeparatedByString:@" "];
    NSString *str;
    str = [arr objectAtIndex:0];    
    NSCharacterSet *doNotWan222t = [NSCharacterSet characterSetWithCharactersInString:@"-"];
    str = [[str componentsSeparatedByCharactersInSet: doNotWan222t] componentsJoinedByString: @"."];
    NSString *sctext= [[NSUserDefaults standardUserDefaults]stringForKey:@"SC_NUM"];
     
            NSString *area = [[NSUserDefaults standardUserDefaults]stringForKey:@"SC_area"];
    //NSString *post = [NSString stringWithFormat:@"&schYm=2012.04"];
    NSString *post1 = [NSString stringWithFormat:@"?schulCode=%@",sctext];
    NSString *url = [[NSString alloc] initWithFormat:@"http://hes.%@.kr/sts_sci_md00_001.do", area];
    NSString *realurl = [NSString stringWithFormat:@"%@%@&schulCrseScCode=4",url,post1];
    NSString *_URL = [[NSString stringWithContentsOfURL:
                       [NSURL URLWithString:realurl]encoding:NSUTF8StringEncoding error:nil]
                      stringByReplacingOccurrencesOfString:@"<br />" withString:@"\n"];
    NSCharacterSet *doNotW11ant = [NSCharacterSet characterSetWithCharactersInString:@"(안)"];
    _URL = [[_URL componentsSeparatedByCharactersInSet: doNotW11ant] componentsJoinedByString: @""];
    //NSLog(@"%@",ddda.text);
    //

    NSData *htmlData = [_URL dataUsingEncoding:NSUTF8StringEncoding];
    
    if (htmlData != nil) {
        
        TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
        
        
        NSArray *parserArray = [xpathParser searchWithXPathQuery:@"//div[@id='pasContentsRight']/div[@class='boardArea4']/table[@class='tableType2']/tbody/tr/td"];
        
      
        int i;
        
        i = stepper.value;
        
    
        TFHppleElement *element = [parserArray objectAtIndex:i];
        //NSLog(@"%@", [element content]);
        
        NSString *ext2 = [element content];
        NSString *mepe = [NSString stringWithFormat:@"%@",ddda.text];
        NSString *mep1 = [NSString stringWithFormat:@"%@",ddda.text];
     //   NSLog(@"%@_테스트", mep1);
      //  NSLog(@"%@_테스트", [element content]);
   
        
        @try {
            if ([[element content] isEqualToString:mep1]) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.3f];
                eat2.alpha = 0.0f;

                lunch.alpha = 0.0f;

                dinner.alpha = 0.0f;
        
                [UIView commitAnimations];
                ext2 = @"\n주말이거나,\n 공휴일이거나,\n 굶는 날이에요.\n\n 기쁘죠?";
                eat.text = ext2;
                //eat2.hidden = YES;
                //lunch.hidden = YES;
                //dinner.hidden = YES;
            }
            
            else {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.3f];
                eat2.alpha = 1.0f;
                
                lunch.alpha = 1.0f;
                
                dinner.alpha = 1.0f;
                [UIView commitAnimations];

                //lunch.hidden = NO;
               // dinner.hidden = NO;
                NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:mepe];
                ext2 = [[ext2 componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];
                //eat.text = [NSString stringWithFormat:@"%@\n\n 잘 먹어요.",ext2];
                //eat2.hidden = NO;
                //NSLog(@"여기냐");
                NSArray * tempArray = [ext2 componentsSeparatedByString:@"\n[중식]\n"];
                NSString * ext22 = [tempArray objectAtIndex:1];
                //NSLog(@"여기냐2");
                NSString *sch_style= [[NSUserDefaults standardUserDefaults]stringForKey:@"SC_STYLE"];
                
                if([sch_style isEqualToString:@"고등학교"])
                {
                    dinner.hidden = NO;
                    eat2.hidden = NO;
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:0.3f];
                    eat2.alpha = 1.0f;
                    
                    lunch.alpha = 1.0f;
                    
                    dinner.alpha = 1.0f;
                    
                    eat.frame = CGRectMake(14, 113, eat.frame.size.width, 160);
                    [UIView commitAnimations];
                    

                    NSArray * tempArray1 = [ext22 componentsSeparatedByString:@"[석식]\n"];
                    
                    NSString * lunch1 = [tempArray1 objectAtIndex:0];
                    NSString * dinner1 = [tempArray1 objectAtIndex:1];
                    eat.text = lunch1;
                    eat2.text = dinner1;
                    
                    
                }
                else{
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:0.3f];
                    //eat.alpha = 0.3f;
                    eat.frame = CGRectMake(14, 113, eat.frame.size.width, 960);
                    //eat2.frame = CGRectMake(14, 324, eat2.frame.size.width, eat2.frame.size.height);
                    [UIView commitAnimations];
                    eat.text = ext22;
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:0.3f];
                    eat2.alpha = 0.0f;
                    
                    // lunch.alpha = 0.0f;
                    
                    dinner.alpha = 0.0f;
                    
                    [UIView commitAnimations];
                    dinner.hidden = YES;
                    eat2.hidden = YES;
                }
                
            }
        }
        @catch (NSException *e) {
            //NSLog(@"에러ㄴ땨");
            NSArray * tempArray = [ext2 componentsSeparatedByString:@"\n[중식]\n"];
            NSString * ext22 = [tempArray objectAtIndex:1];
            eat.text = ext22;
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3f];
            eat2.alpha = 0.0f;
            
           // lunch.alpha = 0.0f;
            
            dinner.alpha = 0.0f;
            
            [UIView commitAnimations];
          
            dinner.hidden = YES;
            eat2.hidden = YES;
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3f];
            //eat.alpha = 0.3f;
            eat.frame = CGRectMake(14, 113, eat.frame.size.width,960);
            //eat2.frame = CGRectMake(14, 324, eat2.frame.size.width, eat2.frame.size.height);
            [UIView commitAnimations];
        }
        @finally{
            
        }
 
            
        
      //  NSLog(@"%@이거시다", ext2);
       //    NSLog(@"%@이거", mepe);
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        //eat.alpha = 0.3f;
        eat.frame = CGRectMake(14, 113, eat.frame.size.width, eat.frame.size.height);
        eat2.frame = CGRectMake(14, 324, eat2.frame.size.width, eat2.frame.size.height);
        [UIView commitAnimations];
        // [UIView beginAnimations:nil context:NULL];
        //[UIView setAnimationDuration:0.5f];
        //eat.alpha = 1.0f;
        //[UIView commitAnimations];
        // [UIView setAnimationDelay:2];

    
    }
    
    
    else {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"연결 실패"
                            message:@"밥을 가져올 수 없습니다. 궁금해요?"
                            delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
        eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
       [alert show];
    }
        
    }
    
    @catch (NSException *e) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"연결 실패"
                                                        message:@"밥을 가져올 수 없습니다. 굶으세요"
                                                       delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
        eat.text = @"\n급식을 찾을수 없습니다.\n지금은 교육청을 욕하세요.";
        [alert show];
    }
    
    
    @finally {
        
    }
    
}

- (IBAction)valueChanged:(UIStepper *)sender
{    
    double value = [sender value];
    [NSString stringWithFormat:@"%d", (int)value];
    [stpnum setText:[NSString stringWithFormat:@"%d", (int)value]];
    [self UseOfHpple];
}




- (void)viewDidLoad
{
    if (![@"1" isEqualToString:[[NSUserDefaults standardUserDefaults]
                                objectForKey:@"Avalue1"]]) {
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"Avalue1"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        start.hidden = NO;
        area_bg.hidden = NO;
        area_view.hidden = NO;
       // NSLog(@"처음이당");
        [eat setFont:[UIFont fontWithName:@"SeoulNamsan" size:23]];
        [eat2 setFont:[UIFont fontWithName:@"SeoulNamsan" size:23]];
       // [self.view addSubview:eat];
       // [eat release];
        
        [calme setFont:[UIFont fontWithName:@"SeoulHangang" size:23]];
        
        [scname2 setFont:[UIFont fontWithName:@"SeoulHangang" size:23]];
        //[self.view addSubview:scname2];
       // [scname2 release];
        
        [scname22 setFont:[UIFont fontWithName:@"SeoulHangang" size:23]];
        //[self.view addSubview:scname22];
        //[scname22 release];
        
        [index setFont:[UIFont fontWithName:@"SeoulHangang" size:43]];
        //[self.view addSubview:index];
        //[index release];
        
        [index_now setFont:[UIFont fontWithName:@"SeoulHangang" size:43]];
        //[self.view addSubview:index_now];
        //[index_now release];
        [self.view addSubview:start];
        
        //[self.view addSubview:hideere];
        //[hideere release];

        UISwipeGestureRecognizer *oneFingerSwipeLeft = [[UISwipeGestureRecognizer alloc]
                                                         initWithTarget:self
                                                         action:@selector(oneFingerSwipeLeft:)];
        [oneFingerSwipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
        [[self view] addGestureRecognizer:oneFingerSwipeLeft];
        
        UISwipeGestureRecognizer *oneFingerSwipeRight = [[UISwipeGestureRecognizer alloc]
                                                          initWithTarget:self
                                                          action:@selector(oneFingerSwipeRight:)];
        [oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
        [[self view] addGestureRecognizer:oneFingerSwipeRight];


    }

    else{
        
  
        UISwipeGestureRecognizer *oneFingerSwipeLeft = [[UISwipeGestureRecognizer alloc]
                                                         initWithTarget:self
                                                         action:@selector(oneFingerSwipeLeft:)];
        [oneFingerSwipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
        [[self view] addGestureRecognizer:oneFingerSwipeLeft];
        
        UISwipeGestureRecognizer *oneFingerSwipeRight = [[UISwipeGestureRecognizer alloc]
                                                          initWithTarget:self
                                                          action:@selector(oneFingerSwipeRight:)];
        [oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
        [[self view] addGestureRecognizer:oneFingerSwipeRight];
        
    index.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"SC_Name_"];
    
    [eat setFont:[UIFont fontWithName:@"SeoulNamsan" size:23]];
            [eat2 setFont:[UIFont fontWithName:@"SeoulNamsan" size:23]];
    //[self.view addSubview:eat];
    //[eat release];
  [calme setFont:[UIFont fontWithName:@"SeoulHangang" size:23]];

    [scname2 setFont:[UIFont fontWithName:@"SeoulHangang" size:23]];
    //[self.view addSubview:scname2];
    //[scname2 release];

    [scname22 setFont:[UIFont fontWithName:@"SeoulHangang" size:23]];
    //[self.view addSubview:scname22];
    //[scname22 release];
    
    [index setFont:[UIFont fontWithName:@"SeoulHangang" size:43]];
   // [self.view addSubview:index];
    //[index release];
    
    [index_now setFont:[UIFont fontWithName:@"SeoulHangang" size:43]];
        
   //     //start.layer.zPosition = 1;
    //[self.view addSubview:index_now];
    //[index_now release];
    [super viewDidLoad];
    [self blank];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    // CGRect는 CGPoint origin, CGSize size로 이루어짐.
   // bannerView_ = [[GADBannerView alloc] initWithFrame:

    // ID는 GADBannerView에 define
  //  bannerView_.adUnitID = MY_BANNER_UNIT_ID;
    
   
    
    NSDate* sourceDate = [NSDate date];
    
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    NSTimeZone* destinationTimeZone = [NSTimeZone systemTimeZone];
    
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:sourceDate];
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:sourceDate];
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    
    NSDate* destinationDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:sourceDate] ;
    
    NSString *strDate = [[NSString alloc] initWithFormat:@"%@",destinationDate];
    NSArray *arr = [strDate componentsSeparatedByString:@" "];
    NSString *str;
    str = [arr objectAtIndex:0];
    NSArray *arr_my = [str componentsSeparatedByString:@"-"];
    NSInteger date = [[arr_my objectAtIndex:2] intValue];
    //NSLog(@"strdate: %@",str);
    // strdate: 2011-02-28
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"-"];
    str = [[str componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @"."];
    //2011-00-00 -> 2011.00.00
   [ggay setText:[NSString stringWithFormat:@"%@",str]];
    bo.hidden = TRUE;
    [datee setText:[NSString stringWithFormat:@"%d일",date]];
    [ddda setText:[NSString stringWithFormat:@"%d",date]];
    [self today];
    
    }

}
- (void)oneFingerSwipeLeft:(UITapGestureRecognizer *)recognizer {
    NSString *nStr;
    
    nStr = ddda.text;
    int j = [nStr intValue];
    
    int i = stepper.value;
    
    NSDate *curDate = [NSDate date];
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSRange daysRange =
    [currentCalendar
     rangeOfUnit:NSDayCalendarUnit
     inUnit:NSMonthCalendarUnit
     forDate:curDate];
    
    // daysRange.length will contain the number of the last day
    // of the month containing curDate
    
    //NSLog(@"%i", daysRange.length);
    
    int l = daysRange.length;


    if (j < l)
    {
        
        j = j + 1;
        i = i + 1;
        stepper.value = i;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        datee.alpha = 0.5f;
        [UIView commitAnimations];
        [datee setText:[NSString stringWithFormat:@"%d",j]];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        eat.frame = CGRectMake(314, 114, eat.frame.size.width, eat.frame.size.height);
        
        eat2.frame = CGRectMake(314, 324, eat2.frame.size.width, eat2.frame.size.height);

        datee.alpha = 1.0f;
        [UIView commitAnimations];
        [ddda setText:[NSString stringWithFormat:@"%d",j]];
        [stpnum setText:[NSString stringWithFormat:@"%d", i]];
        
        [self UseOfHpple];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"이번달은 여기까지"
                                                        message:@"끝났는데..?"
                                                       delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
        [alert show];
    }
    
}

- (void)oneFingerSwipeRight:(UITapGestureRecognizer *)recognizer {
    NSString *nStr;
    
    nStr = ddda.text;
    int j = [nStr intValue];
    
    int i = stepper.value;
    
    
    if (j > 1 )
    {
        i = i - 1;
        stepper.value = i;
        j = j - 1;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        datee.alpha = 0.5f;
        [UIView commitAnimations];
        [datee setText:[NSString stringWithFormat:@"%d",j]];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        eat.frame = CGRectMake(-284, 114, eat.frame.size.width, eat.frame.size.height);
        eat2.frame = CGRectMake(-284, 324, eat2.frame.size.width, eat2.frame.size.height);
        datee.alpha = 1.0f;
        [UIView commitAnimations];;
        [ddda setText:[NSString stringWithFormat:@"%d",j]];
        [self UseOfHpple];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"이번달은 여기까지"
                                                        message:@"끝났는데..?"
                                                       delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
        [alert show];
    }
}
- (IBAction)start:(UIButton *)sender;{
    
    start.hidden = YES;
}



-(void)today;
{
    index.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"SC_Name_"];
    NSDate* sourceDate = [NSDate date];
    
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    NSTimeZone* destinationTimeZone = [NSTimeZone systemTimeZone];
    
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:sourceDate];
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:sourceDate];
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    
    NSDate* destinationDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:sourceDate] ;
    
    NSString *strDate = [[NSString alloc] initWithFormat:@"%@",destinationDate];
    NSArray *arr = [strDate componentsSeparatedByString:@" "];
    NSString *str;
    str = [arr objectAtIndex:0];
    NSArray *arr_my = [str componentsSeparatedByString:@"-"];
    NSInteger date = [[arr_my objectAtIndex:2] intValue];
    
    NSString *nStr;
    
    nStr = today.text;
    int j = [nStr intValue];
    
    stepper.value = (date+j-1);
    [datee setText:[NSString stringWithFormat:@"%d",date]];
    [ddda setText:[NSString stringWithFormat:@"%d",date]];
    [self UseOfHpple];
    
    
}

- (IBAction)valueTodayed:(UIButton *)sender;
{
    [self today];
}

- (IBAction)savescnum:(UIButton *)sender;
{
 
    [[NSUserDefaults standardUserDefaults]setObject:scnum.text forKey:@"SC_Name"];

}

- (IBAction)savessg:(UIButton *)sender;
{
    
    [[NSUserDefaults standardUserDefaults]setObject:@"안곡고등학교" forKey:@"SC_Name_"];

    [[NSUserDefaults standardUserDefaults]setObject:@"J100005600" forKey:@"SC_NUM"];
    [self today];
    
    [self dismissModalViewControllerAnimated:YES];
  

}

- (IBAction)savescsm:(UIButton *)sender;
{
    [[NSUserDefaults standardUserDefaults]setObject:@"소명여자고등학교" forKey:@"SC_Name_"];
    
    [[NSUserDefaults standardUserDefaults]setObject:@"J100000630" forKey:@"SC_NUM"];
    
  
    
    [self dismissModalViewControllerAnimated:YES];
 

}
- (IBAction)debug:(UIButton *)sender;

{
    [[NSUserDefaults standardUserDefaults]setObject:@"디버그_소명" forKey:@"SC_Name_"];
    
    [[NSUserDefaults standardUserDefaults]setObject:@"고등학교" forKey:@"SC_STYLE"];

    [[NSUserDefaults standardUserDefaults]setObject:@"J100000630" forKey:@"SC_NUM"];
    
}
- (IBAction)DIS:(UIButton *)sender;
{
    [self dismissModalViewControllerAnimated:YES];
}


- (void) pageChangeValue:(id)sender 
{
   }


- (void)scrollViewDidScroll:(UIScrollView *)sender 
{  

}

- (void)pagecurrent
{
    
    
}

- (void)didReceiveMemoryWarning 
{
    
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
    
}


- (void)viewDidAppear:(BOOL)animated
{
    if (![@"1" isEqualToString:[[NSUserDefaults standardUserDefaults]
                                objectForKey:@"Avalue_now1"]]) {
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"Avalue_now1"];
        [[NSUserDefaults standardUserDefaults] synchronize];
     
        //NSLog(@"처음이당");
        eat.text = @"";
        eat2.text = @"";
        index.text = @"여기를 눌러요!";
        
        start.hidden = NO;
        area_bg.hidden = NO;
        area_view.hidden = NO;
    }
    else{
        [self blank];
        [self today];
  
    }

}


- (void)viewDidUnload 
{
    
    [super viewDidUnload];

  
}


- (void)dealloc
{
    

    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
-(IBAction)area:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"sen.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    
    area_bg.hidden = YES;
    area_view.hidden = YES;
}

-(IBAction)area_gyunggi:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"goe.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    area_bg.hidden = YES;
    area_view.hidden = YES;
}

-(IBAction)area_gangone:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"kwe.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    area_bg.hidden = YES;
    area_view.hidden = YES;
}

-(IBAction)area_junrabuk:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"jbe.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    area_bg.hidden = YES;
    area_view.hidden = YES;
}

-(IBAction)area_junranam:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"jne.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    area_bg.hidden = YES;
    area_view.hidden = YES;
}

-(IBAction)area_jje:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"jje.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    area_bg.hidden = YES;
    area_view.hidden = YES;
}

-(IBAction)area_chungcung:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"cne.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    
    area_bg.hidden = YES;
    area_view.hidden = YES;}

-(IBAction)area_gangju:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"gen.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    
    area_bg.hidden = YES;
    area_view.hidden = YES;}

-(IBAction)area_pusan:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"pen.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    
    area_bg.hidden = YES;
    area_view.hidden = YES;}

-(IBAction)area_gne:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"gne.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    
    area_bg.hidden = YES;
    area_view.hidden = YES;}

-(IBAction)area_gbe:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"gbe" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                               message:@"학교 설정을 해주세요!"
                                                                                                                              delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    
    area_bg.hidden = YES;
    area_view.hidden = YES;}

-(IBAction)area_use:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"use.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    
    area_bg.hidden = YES;
    area_view.hidden = YES;}

-(IBAction)area_dje:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"dje.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    
    area_bg.hidden = YES;
    area_view.hidden = YES;}

-(IBAction)area_cbe:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"cbe.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    
    area_bg.hidden = YES;
    area_view.hidden = YES;}

-(IBAction)area_sje:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"sje.go" forKey:@"SC_area"]; UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                                                                                                  message:@"학교 설정을 해주세요!"
                                                                                                                                 delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    
    area_bg.hidden = YES;
    area_view.hidden = YES;}

-(IBAction)area_ice:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"ice.go" forKey:@"SC_area"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                    message:@"학교 설정을 해주세요!"
                                                   delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    
    
    area_bg.hidden = YES;
    area_view.hidden = YES;}

-(IBAction)area_dge:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"dge.go" forKey:@"SC_area"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"지역설정 성공"
                                                    message:@"학교 설정을 해주세요!"
                                                   delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
    [alert show];
    
    area_bg.hidden = YES;
    area_view.hidden = YES;}


-(IBAction)area_north:(UIButton *)sender
{
    
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"간첩신고는 113"
                                         message:@"우리 인민들은 급식같은거 할 돈 없는거 몰라서 이러네?"
                                               delegate:self cancelButtonTitle:@"관심주기" otherButtonTitles:nil];
                                                //eat.text = @"\n급식을 찾을수 없습니다.\n인터넷이 제정신인지 확인해주세요.";
                                                [alert show];
    
}
@end
