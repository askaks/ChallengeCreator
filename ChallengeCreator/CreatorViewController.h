//
//  CreatorViewController.h
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/4/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import <UIKit/UIKit.h>
//#include <libxml/HTMLparser.h>

@interface CreatorViewController : UIViewController <NSXMLParserDelegate>

@property (weak, nonatomic) IBOutlet UILabel *correctlyLoadedXMLLabel;
- (IBAction)LoadChallengesXML:(id)sender;

@end
