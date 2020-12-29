//
//  LPViewController.m
//  JSONTest
//
//  Created by Park Lambert on 11. 10. 20..
//  Copyright (c) 2011년 __MyCompanyName__. All rights reserved.
//

#import "LPViewController.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@interface NSDictionary (JSONCategories)

+ (NSDictionary *)dictionaryWithContentsOfJSONURLString:(NSString *)urlAddress;
- (NSData *)toJSON;

@end

@implementation NSDictionary (JSONCategories)

+ (NSDictionary *)dictionaryWithContentsOfJSONURLString:(NSString *)urlAddress
{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlAddress]];
    __autoreleasing NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

- (NSData *)toJSON
{
    NSError *error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;    
}
@end


@implementation LPViewController
{
    NSArray *timelines;
}
@synthesize sc_find_text;

@synthesize table;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
  
}
- (IBAction)start:(id)sender
{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3f];
    table.hidden = NO;
    [UIView commitAnimations];

    
[self find];
    
    [sc_find_text resignFirstResponder];

}
- (IBAction)sex:(id)sender
{
    
[[NSUserDefaults standardUserDefaults] setValue:@"reset" forKey:@"Avalue1"];
[[NSUserDefaults standardUserDefaults] synchronize];
[[NSUserDefaults standardUserDefaults] setValue:@"reset" forKey:@"Avalue_now1"];
[[NSUserDefaults standardUserDefaults] synchronize];
[self dismissModalViewControllerAnimated:YES];
    
}
- (void)find{
    

    dispatch_async(kBgQueue, ^{
     
        NSString *area = [[NSUserDefaults standardUserDefaults]stringForKey:@"SC_area"];

        NSString *newString = sc_find_text.text;
        NSString *url = [[NSString alloc] initWithFormat:@"http://hes.%@.kr/spr_ccm_cm01_100.do?kraOrgNm=%@", area, [newString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        //NSLog(@"%@",url);
        // NSString *realurl = [NSString stringWithFormat:@"%@?kraOrgNm=%@",url,];
        NSString *_URL = [NSString stringWithContentsOfURL:
                          [NSURL URLWithString:url]encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [_URL dataUsingEncoding:NSUTF8StringEncoding];
                [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });

}
- (IBAction)DIS:(UIButton *)sender;
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [timelines count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text =[[timelines objectAtIndex:indexPath.row]objectForKey:@"kraOrgNm"];

    [[UIDevice currentDevice] model];

    [[UIDevice currentDevice] name];

    [[UIDevice currentDevice] systemName];

    [[UIDevice currentDevice] systemVersion];

    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSString *SCname = [[timelines objectAtIndex:indexPath.row]objectForKey:@"kraOrgNm"];
    NSString *SCorg = [[timelines objectAtIndex:indexPath.row]objectForKey:@"orgCode"];
    NSString *SCorg2 = [[timelines objectAtIndex:indexPath.row]objectForKey:@"schulCrseScCodeNm"];
    [[NSUserDefaults standardUserDefaults]setObject:SCname forKey:@"SC_Name_"];
    [[NSUserDefaults standardUserDefaults]setObject:SCorg forKey:@"SC_NUM"];
    [[NSUserDefaults standardUserDefaults]setObject:SCorg2 forKey:@"SC_STYLE"];
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
    //                                                message:@"학교가 저장되었습니다."
      //                                             delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    //[alert show];
    NSLog(@"[학교정보저장]%@ (model : %@, name : %@, systemName : %@, systemVersion : %@)" ,SCname,
          [[UIDevice currentDevice] model],
          [[UIDevice currentDevice] name],
          [[UIDevice currentDevice] systemName],
          [[UIDevice currentDevice] systemVersion]);
    
    [self dismissModalViewControllerAnimated:YES];
    //[self.navigationController pushViewController:ViewController animated:YES];
    
}

// 데이터 가져오기.
- (void)fetchedData:(NSData *)responseData 
{
    // JSON 파싱.
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:kNilOptions 
                                                           error:&error];
    //NSLog(@"timelines: %@", json);
    
    timelines = [[json objectForKey:@"resultSVO"] objectForKey:@"orgDVOList"] ;
    
    [self.table reloadData];
}

@end
