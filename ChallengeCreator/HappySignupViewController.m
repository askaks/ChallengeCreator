//
//  HappySignupViewController.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 3/6/14.
//
//

#import "HappySignupViewController.h"

#import <Parse/Parse.h>

#import "CreatorViewController.h"


@interface HappySignupViewController ()

@end

@implementation HappySignupViewController


- (IBAction)editingBegin:(id)sender
{
    [self animateViewUp:YES];
}

- (IBAction)endPassword:(id)sender
{
    [self animateViewUp:NO];
}

- (IBAction)endEmail:(id)sender
{
    [self animateViewUp:NO];
}

- (void)animateViewUp:(BOOL)up
{
    const int movementDistance = 100; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

#pragma mark -
#pragma mark -hiding keyboard

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	
	return YES;
}

- (IBAction)start:(id)sender
{
    //
    // Create a screen for entering real email and password
    // Otherwise only one user would be saved.
    //
    NSString *email = _emailText.text;
    NSString *pass = _passText.text;
    
    // Create new user, it's so simple
    PFUser *user = [PFUser user];
    
    user.username = email;
    user.password = pass;
    
    //
    // Signing up the new user to check if the user is not there already
    //
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error)
        {
            NSLog(@"New user signup for the first time");
            
            [self passed];
        }
        else
        {
            NSLog(@"User signup before we can try to login");
            
            //
            // User was there already so logging in with the email and password
            //
            [PFUser logInWithUsernameInBackground:email
                                         password:pass
                                            block:^(PFUser *user, NSError *error) {
                                                if (user)
                                                {
                                                    NSLog(@"User exists so we can continue");
                                                    // you can access user with e.g.
                                                    // name = [PFUser currentUser][@"name"]
                                                    [self passed];
                                                }
                                                else
                                                {
                                                    NSLog(@"Could not login!!!");
                                                }
                                            }];
        }
    }];
    

}

- (void)passed
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    UIViewController *initViewController = [storyBoard instantiateInitialViewController];
    
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:initViewController];
}

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
    // Do any additional setup after loading the view from its nib.
    
    // Loging out the old user, here you don't need to do it
    [PFUser logOut];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setEmailText:nil];
    [self setPassText:nil];
    [super viewDidUnload];
}
@end
