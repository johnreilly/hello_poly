#import "Controller.h"

@implementation Controller
- (IBAction)decrease {
    NSLog(@"decrease clicked");
	[self changeNumberOfSides:[numberOfSidesLabel.text integerValue] - 1];
	[self updateInterface];
}

- (IBAction)increase {
    NSLog(@"increase clicked");
	[self changeNumberOfSides:[numberOfSidesLabel.text integerValue] + 1];
	[self updateInterface];
}

- (IBAction)sliderChanged {
    NSLog(@"slider changed");
	[self changeNumberOfSides:slider.value];
	[self updateInterface];
}

-(void)changeNumberOfSides:(int)numOfSides {
	[polygon setNumberOfSides:numOfSides];
	[defaults setInteger:numOfSides forKey:@"numberOfSides"];
}

- (void)updateInterface {
	NSLog(@"updating interface");
	
	decreaseButton.enabled = ([polygon numberOfSides] > [polygon minimumNumberOfSides]);
	increaseButton.enabled = ([polygon numberOfSides] < [polygon maximumNumberOfSides]);
	
	numberOfSidesLabel.text = [[NSNumber numberWithInt:[polygon numberOfSides]] stringValue];
	
	slider.value = [polygon numberOfSides];
	
	[polygonView setNeedsDisplay]; 
}

- (void)awakeFromNib {
	
	//setup defaults
	defaults = [NSUserDefaults standardUserDefaults];
	if (![defaults integerForKey:@"numberOfSides"]) {
		[defaults setInteger:5 forKey:@"numberOfSides"];
	}
	
	NSLog(@"numberOfSides is %d", [defaults integerForKey:@"numberOfSides"]);
	
	[polygon setMinimumNumberOfSides:[defaults integerForKey:@"minNumberOfSides"]];
	[polygon setMaximumNumberOfSides:[defaults integerForKey:@"maxNumberOfSides"]];
	[polygon setNumberOfSides:[defaults integerForKey:@"numberOfSides"]];
	
	slider.minimumValue = polygon.minimumNumberOfSides;
	slider.maximumValue = polygon.maximumNumberOfSides;
	slider.value = polygon.numberOfSides;
	
	[self updateInterface];
	
	NSLog(@"Configured polygon: %@", polygon);
}
@end
