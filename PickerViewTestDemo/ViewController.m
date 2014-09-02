//
//  ViewController.m
//  PickerViewTestDemo
//
//  Created by fei on 14-9-1.
//  Copyright (c) 2014年 self. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIPickerView *_pickerView;
    NSMutableArray *dataArray;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _testButton.titleLabel.text = @"adsfasfdadf";
    
    dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    [dataArray addObjectsFromArray:[NSArray arrayWithObjects:@"很好",@"一般",@"很差",nil]];
    [self setupPickerView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)setupPickerView
{
    UIToolbar* toolbar = [[UIToolbar alloc] init];
    toolbar.frame=CGRectMake(0,0,320,44);
    toolbar.barStyle = UIBarStyleBlackOpaque;
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                                                     style:UIBarButtonItemStyleDone target:self
                                                                    action:@selector(docancel:)];
    
    UIBarButtonItem* titleButton = [[UIBarButtonItem alloc] initWithTitle:@"请选择所在地区"
                                                                    style:UIBarButtonItemStyleDone target:nil
                                                                   action:nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"确定"
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(saveChoice:)];
    [toolbar setItems:[NSArray arrayWithObjects:cancelButton,flexibleSpaceLeft,titleButton, flexibleSpaceLeft, doneButton, nil]];
    [self.view addSubview:toolbar];
    _pickerView = [[UIPickerView alloc]init] ;
    _pickerView.frame=CGRectMake(0, 44, 320,216);
    _pickerView.delegate = self;
    _pickerView.showsSelectionIndicator = YES;
    _pickerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_pickerView];
    
}

-(void)docancel:(UIButton *)btn {
    
}
-(void)saveChoice:(UIButton *)btn {
    
}
- (IBAction)buttonClicked:(UIButton *)sender {
    _testButton.titleLabel.text = @"aaaaaa";
//    [_testButton setTitle:@"bbbbb" forState:UIControlStateNormal];
    [_pickerView selectRow:2 inComponent:2 animated:YES];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"select :%@",[dataArray objectAtIndex:row]);
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view

{
    UILabel *myView = nil;
    myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 120, 24)];
    myView.textAlignment = NSTextAlignmentCenter;
    myView.font = [UIFont systemFontOfSize:14];         //用label来设置字体大小
    myView.backgroundColor = [UIColor clearColor];
    
    myView.text = [dataArray objectAtIndex:row];
    
    return myView;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return dataArray.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    CGFloat componentWidth = 90.0;
    
   
    return componentWidth;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
