#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonView.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
	IBOutlet UISlider *slider;
	IBOutlet PolygonView *polygonView;
	IBOutlet PolygonShape *polygon;
	NSUserDefaults *defaults;
}
- (IBAction)decrease;
- (IBAction)increase;
- (IBAction)sliderChanged;
- (void)updateInterface;
- (void)changeNumberOfSides:(int)numOfSides;
@end
