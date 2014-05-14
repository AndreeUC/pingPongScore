//
//  ViewController.h
//  pingPongScore
//
//  Created by Mac User on 4/30/14.
//  Copyright (c) 2014 systemusa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewGameViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "AVFoundation/AVFoundation.h"

@interface ViewController : UIViewController  <UIAlertViewDelegate> 



- (IBAction)score1:(id)sender;

- (IBAction)pausa:(id)sender;
- (IBAction)score2:(id)sender;

@property (weak,nonatomic) NSString  *contcontinue;
@property (weak, nonatomic) IBOutlet UIButton *score1Text;
@property (weak, nonatomic) IBOutlet UIButton *score2Text;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImage;
@property (weak, nonatomic) IBOutlet UILabel *player1;
@property (weak, nonatomic) IBOutlet UILabel *player2;


@end
