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
	
	//draw frame
	[[UIColor grayColor] set]; 
	UIRectFill ([self bounds]); 
	[[UIColor blackColor] set];
	UIRectFrame([self bounds]);
	
	//set up points for polygon
	CGContextBeginPath (context); 
	
	//create first point
	NSArray *point_array = [PolygonView pointsForPolygonInRect:[self bounds] numberOfSides:[polygon numberOfSides]];
	NSValue *theValue = [point_array objectAtIndex:0];
	CGPoint thePoint = [theValue CGPointValue];
	
	CGContextMoveToPoint (context, thePoint.x, thePoint.y); 
	
	//create remaining points
	NSRange range;
	range.location = 1;
	range.length = [point_array count] - 1;
	for (NSValue *val in [point_array subarrayWithRange:range]){
		CGPoint pt = [val CGPointValue];
		CGContextAddLineToPoint (context, pt.x, pt.y); 
	}
	
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
