//
//  CreatorViewController.h
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/4/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorOptionsViewController.h"
//#import "G"
//#include <libxml/HTMLparser.h>

@interface CreatorViewController : UIViewController <NSXMLParserDelegate>


@property (weak, nonatomic) IBOutlet UILabel *correctlyLoadedXMLLabel;
@property (nonatomic, retain) NSMutableArray *Challenges;
@property (nonatomic, retain) NSString *downloadedXML;
@property (nonatomic, retain) NSString *tobeUploadedXML;

- (IBAction)LoadChallengesXML:(id)sender;
- (IBAction)createXML:(id)sender;
- (IBAction)writeOutXML:(id)sender;

@end
