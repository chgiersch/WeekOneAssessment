//
//  ViewController.m
//  WeekOneAssessment
//
//  Created by Chris Giersch on 1/9/15.
//  Copyright (c) 2015 ChrisGiersch. All rights reserved.
//

#import "RootViewController.h"
#import "WebViewController.h"

@interface RootViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *valueOneTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueTwoTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *webBarButtonItem;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@property int answer;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.valueOneTextField.delegate = self;
    [self.valueTwoTextField setDelegate:self];

    // Dismiss keyboard if tap outside of textfield
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}


- (IBAction)onCalculateButtonPressed:(UIButton *)sender
{
    self.answer = [self.valueOneTextField.text intValue] * [self.valueTwoTextField.text intValue];
    self.navigationItem.title = [NSString stringWithFormat:@"%i", self.answer];

    // Dismiss keyboard
    [self dismissKeyboard];

    // Disable "web" bar button item unless answer is 5
    if (self.answer == 5)
    {
        self.webBarButtonItem.enabled = TRUE;
    }
    else
    {
        self.webBarButtonItem.enabled = FALSE;
    }
}

- (void)dismissKeyboard
{
    [self.view endEditing:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *webViewController = segue.destinationViewController;
    webViewController.navigationItem.title = [NSString stringWithFormat:@"%d", self.answer];
}

@end
