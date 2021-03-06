#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "PolygonShape.h"

@interface PolygonView : UIView {
    IBOutlet PolygonShape *polygon;
	IBOutlet UILabel *shapeLabel;
}

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;

@end
