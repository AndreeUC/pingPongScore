//
//  ViewController.m
//  pingPongScore
//
//  Created by Mac User on 4/30/14.
//  Copyright (c) 2014 systemusa. All rights reserved.
//created by Andres castro jaquez, with cooperation of jose ramirez and marcos garcia

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>


#define alertuno 1
#define alerttres 3
@interface ViewController ()

@end

@implementation ViewController
NSInteger jugScore1=0;
NSInteger jugscore2=0;
NSInteger contador=0;
NSInteger resultadoadv=0;
bool bandera;
bool banderasonido=YES;
NSString *ganador;
NSInteger contadorcam=5;
NSInteger  posicionx;
NSInteger  posicion2x;


- (void)viewDidLoad
{
   
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.w
}



- (BOOL)prefersStatusBarHidden {return YES;}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"pause"]) {
        
        NewGameViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.cadena=@"yes";
       
    }
}
-(void) playsound{
    CFBundleRef mainBundle= CFBundleGetMainBundle();
    CFURLRef soundFileUrl;
    soundFileUrl= CFBundleCopyResourceURL(mainBundle, (CFStringRef) @"switch2", CFSTR("mp3"),NULL);
    UInt32 soundID;
    AudioServicesCreateSystemSoundID(soundFileUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
    

}
-(void) playsoundPelota{
    CFBundleRef mainBundle= CFBundleGetMainBundle();
    CFURLRef soundFileUrl;
    soundFileUrl= CFBundleCopyResourceURL(mainBundle, (CFStringRef) @"pelotasonido2", CFSTR("mp3"),NULL);
    UInt32 soundID;
    AudioServicesCreateSystemSoundID(soundFileUrl, &soundID);
    AudioServicesPlaySystemSound(soundID);
    
    
}

-(NSString*)advance {
    NSString *player;
    contadorcam=1;
    resultadoadv= jugScore1+jugscore2;
    if (resultadoadv % 2 ==false) {
        if (jugScore1>jugscore2) {
            player=@"Player1";
              bandera=YES;
            return player;
          
        }
        else{
            if (jugScore1<jugscore2) {
                player=@"Player2";
                bandera=YES;
                return player;
            }
            
           
        }
    }
     bandera= YES;
    return player;
   
}


- (IBAction)score1:(id)sender {
    [self playsoundPelota];
    jugScore1++;
    contador++;
    NSString *cadena= [@(jugScore1) stringValue];
    [sender setTitle:cadena forState:UIControlStateNormal];
    
    if (jugscore2==20 & jugScore1==20) {
        jugScore1=0;
        jugscore2=0;
        [self.score1Text setTitle: @"0" forState: UIControlStateNormal];
        
        [self.score2Text setTitle: @"0" forState: UIControlStateNormal];
        ganador=[self advance];
    }
    if (bandera==YES) {
        ganador=[self advance];
    }
    if (jugScore1==21) {
        ganador=@"Player1";
       UIAlertView *theAlert1 = [[UIAlertView alloc] initWithTitle:@"Victory"
        message:[NSString stringWithFormat:@"The winner is %@", ganador] delegate:self
        cancelButtonTitle:@"New Game"
         otherButtonTitles:@"Main Menu", nil];
        theAlert1.tag= alertuno;
        
        [theAlert1 show];
      
        jugscore2=0;
        jugScore1=0;
        contador=0;
        contador=5;
        banderasonido=NO;
        
      
        [self.score1Text setTitle: @"0" forState: UIControlStateNormal];
        
        [self.score2Text setTitle: @"0" forState: UIControlStateNormal];
     
        
    }
    if (bandera==YES & ganador!= NULL)  {
        UIAlertView *theAlert1 = [[UIAlertView alloc] initWithTitle:@"Victory"
         message:[NSString stringWithFormat:@"The winner is %@", ganador] delegate:self
         cancelButtonTitle:@"New Game"
         otherButtonTitles:@"Main Menu", nil];
        theAlert1.tag= alertuno;
        
        [theAlert1 show];
        contadorcam=5;
        bandera=NO;
         banderasonido=NO;
    }
    if (contador %contadorcam ==0 & banderasonido==YES) {
        posicionx= self.score2Text.center.x;
        posicion2x= self.score1Text.center.x;
  
        if (self.arrowImage.center.x == posicionx ) {
            
            self.arrowImage.center= CGPointMake(posicion2x, 260);
           [self playsound];
            
        }
        else {
            self.arrowImage.center= CGPointMake(posicionx, 260);
            [self playsound];
        }
    }
    banderasonido=YES;
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==alertuno) {
        if (buttonIndex == 0)
        {
            jugscore2=0;
            jugScore1=0;
            contador=0;
            contadorcam=5;
            
            [self.score1Text setTitle: @"0" forState: UIControlStateNormal];
            [self.score2Text setTitle: @"0" forState: UIControlStateNormal];
            
            
        }
        if (buttonIndex == 1)
        {
            //[self dismissModalViewControllerAnimated:YES];
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }

    }
    if (alertView.tag==alerttres) {
        if (buttonIndex == 0)
        {
            jugscore2=0;
            jugScore1=0;
            contador=0;
            
            [self.score1Text setTitle: @"0" forState: UIControlStateNormal];
            [self.score2Text setTitle: @"0" forState: UIControlStateNormal];
            
            
        }
        if (buttonIndex == 1)
        {
            
            
            
          
            
        }
        
    }
    
}

- (IBAction)score2:(id)sender {
    [self playsoundPelota];
 
    jugscore2++;
    contador++;
    NSString *cadena= [@(jugscore2) stringValue];
    [sender setTitle:cadena forState:UIControlStateNormal];
    if (jugscore2==20 &jugScore1==20) {
        
        jugScore1=0;
        jugscore2=0;
        [self.score1Text setTitle: @"0" forState: UIControlStateNormal];
        
        [self.score2Text setTitle: @"0" forState: UIControlStateNormal];
        
        ganador= [self advance];
        
        
    }
    if (bandera==YES) {
        ganador=[self advance];
    }
    
    if (jugscore2==21) {
        ganador=@"Player2";
        UIAlertView *theAlert2 = [[UIAlertView alloc] initWithTitle:@"Victory"
        message: [NSString stringWithFormat:@"The winer is %@", ganador] delegate:self
            cancelButtonTitle:@"New Game"
        otherButtonTitles:@"Main Menu", nil];
           theAlert2.tag= alertuno;
        [theAlert2 show];
        jugscore2=0;
        jugScore1=0;
        contador=0;
         banderasonido=NO;
    
        [self.score1Text setTitle: @"0" forState: UIControlStateNormal];
        [self.score2Text setTitle: @"0" forState: UIControlStateNormal];
        
        
    
      }
    if (bandera==YES  & ganador!= NULL) {
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Victory"
                                                            message:[NSString stringWithFormat:@"The winner is %@", ganador] delegate:self
                                                  cancelButtonTitle:@"New Game"
                                                  otherButtonTitles:@"Main Menu", nil];
        theAlert.tag= alertuno;
        
        [theAlert show];
        contadorcam=5;
        bandera=NO;
         banderasonido=NO;
    }
    if (contador %contadorcam ==0& banderasonido==YES) {
        posicionx= self.score2Text.center.x;
        posicion2x= self.score1Text.center.x;
        NSLog(@"cambio ");
        if (self.arrowImage.center.x == posicionx ) {
            self.arrowImage.center= CGPointMake(posicion2x, 260);
          [self playsound];
            
        }
        else {
            self.arrowImage.center= CGPointMake(posicionx, 260);
       [self playsound];
        }
    }
    banderasonido=YES;
}

    
    


- (IBAction)pausa:(id)sender {
    UIAlertView *theAlertPause = [[UIAlertView alloc] initWithTitle:@"PAUSED"
                                                       message: @"The game is paused" delegate:self
                                             cancelButtonTitle:@"New Game"
                                             otherButtonTitles:@"Continue", nil];
    theAlertPause.tag= alerttres;
    [theAlertPause show];
 
}

@end
