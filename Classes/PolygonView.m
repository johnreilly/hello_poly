#import "PolygonView.h"

@implementation PolygonView

- (void)drawRect:(CGRect)rect {
	NSLog(@"drawing view");
	
//	CGRect bounds = [self bounds]; 
//	[[UIColor grayColor] set]; 
//	UIRectFill (bounds); 
//	CGRect square = CGRectMake (10, 10, 50, 100); 
//	[[UIColor redColor] set]; 
//	UIRectFill (square); 
//	[[UIColor blackColor] set]; 
//	UIRectFrame (square);
	
	CGContextRef context = UIGraphicsGetCurrentContext(); 
	[[UIColor grayColor] set]; 
	UIRectFill ([self bounds]); 
	CGContextBeginPath (context); 
	CGContextMoveToPoint (context, 75, 10); 
	CGContextAddLineToPoint (context, 10, 150); 
	CGContextAddLineToPoint (context, 160, 150); 
	CGContextClosePath (context); 
	[[UIColor redColor] setFill]; 
	[[UIColor blackColor] setStroke]; 
	CGContextDrawPath (context, kCGPathFillStroke);
}


+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides { 
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0); 
	float radius = 0.9 * center.x; 
	NSMutableArray *result = [NSMutableArray array]; 
	float angle = (2.0 * M_PI) / numberOfSides; 
	float exteriorAngle = M_PI - angle; 
	float rotationDelta = angle - (0.5 * exteriorAngle); 
	
	for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) { 
		float newAngle = (angle * currentAngle) - rotationDelta; 
		float curX = cos(newAngle) * radius; 
		float curY = sin(newAngle) * radius; 
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, 
																center.y + curY)]]; 
	} 
	
	return result; 
}
@end
