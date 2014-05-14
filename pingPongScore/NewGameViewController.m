//
//  NewGameViewController.m
//  pingPongScore
//
//  Created by Mac User on 5/1/14.
//  Copyright (c) 2014 systemusa. All rights reserved.
//

#import "NewGameViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"

@interface NewGameViewController ()

@end

@implementation NewGameViewController

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
    //ViewController *controlador= [[ViewController alloc] init];
    /*[self.outnewGame setHidden:NO];
    [self.outstart setHidden:NO];
    if ( [self.cadena isEqual:@"yes"]) {
        [self.outstart setHidden:YES];
        [self.outcontinue setHidden:NO];
        [self.outcontinue setEnabled:YES];
        
    }*/
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)start:(id)sender {
  
    [self performSegueWithIdentifier:@"start" sender:self];
}

- (BOOL)prefersStatusBarHidden {return YES;}

    
    
    



@end
