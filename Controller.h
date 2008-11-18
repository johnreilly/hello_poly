#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonView.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
	IBOutlet PolygonView *polygonView;
	IBOutlet PolygonShape *polygon;
}
- (IBAction)decrease;
- (IBAction)increase;
- (void)updateInterface;
@end
