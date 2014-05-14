//
//  NewGameViewController.h
//  pingPongScore
//
//  Created by Mac User on 5/1/14.
//  Copyright (c) 2014 systemusa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewGameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *outstart;


@property (strong, nonatomic) NSString *cadena;



- (IBAction)start:(id)sender;



@end
