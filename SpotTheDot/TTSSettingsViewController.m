//
//  TTSSettingsViewController.m
//  SpotTheDot
//
//  Created by B.J. Ray on 12/19/12.
//  Copyright (c) 2012 Thought Syndicate. All rights reserved.
//

#import "TTSSettingsViewController.h"

@interface TTSSettingsViewController ()

@end

@implementation TTSSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
