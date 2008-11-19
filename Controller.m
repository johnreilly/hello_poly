#import "Controller.h"

@implementation Controller
- (IBAction)decrease {
    NSLog(@"decrease clicked");
	[polygon setNumberOfSides:[numberOfSidesLabel.text integerValue] - 1];
	[self updateInterface];
}

- (IBAction)increase {
    NSLog(@"increase clicked");
	[polygon setNumberOfSides:[numberOfSidesLabel.text integerValue] + 1];
	[self updateInterface];
}

- (IBAction)sliderChanged {
    NSLog(@"slider changed");
	[polygon setNumberOfSides:slider.value];
	[self updateInterface];
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
	[polygon setMinimumNumberOfSides:3];
	[polygon setMaximumNumberOfSides:12];
	[polygon setNumberOfSides:3];
	
	slider.minimumValue = polygon.minimumNumberOfSides;
	slider.maximumValue = polygon.maximumNumberOfSides;
	slider.value = polygon.numberOfSides;
	
	[self updateInterface];
	
	NSLog(@"Configured polygon: %@", polygon);
}
@end
