//
//  PolygonShape.m
//  WhatATool
//
//  Created by John Reilly on 11/16/08.
//  Copyright 2008 Tightrope Media Systems. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (void)setNumberOfSides:(int)sides {
	if (sides > maximumNumberOfSides) {
		NSLog(@"Invalid number of sides: %d is greater than the maximum of %d allowed", sides, maximumNumberOfSides);
		return;
	}
	else if (sides < minimumNumberOfSides) {
		NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed", sides, minimumNumberOfSides);
		return;
	}
	
	numberOfSides = sides;
}

- (void)setMinimumNumberOfSides:(int)sides {
	if (sides < 2) {
		NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed", sides, 2);
		return;
	}
	minimumNumberOfSides = sides;
}

- (void)setMaximumNumberOfSides:(int)sides {
	if (sides > 12) {
		NSLog(@"Invalid number of sides: %d is greater than the minimum of %d allowed", sides, 12);
		return;
	}
	maximumNumberOfSides = sides;
}

- (float)angleInDegrees {
	return (180 * (numberOfSides - 2) / numberOfSides);
}

- (float)angleInRadians {
	return [self angleInDegrees] * M_PI / 180;
}

- (NSString *)name {
	NSString *result;
	switch ([self numberOfSides]) {
		case 2:
			result = @"digon";
			break;
		case 3:
			result = @"triangle";
			break;
		case 4:
			result = @"quadrilateral";
			break;
		case 5:
			result = @"pentagon";
			break;
		case 6:
			result = @"hexagon";
			break;
		case 7:
			result = @"heptagon";
			break;
		case 8:
			result = @"octagon";
			break;
		case 9:
			result = @"nonagon";
			break;
		case 10:
			result = @"decagon";
			break;
		case 11:
			result = @"hendecagon";
			break;
		case 12:
			result = @"dodecagon";
			break;
		default:
			break;
	}
	return result;
}

- (id)init{
	return [self initWithNumberOfSides:5 minimumNumberOfSides:2 maximumNumberOfSides:12];
}
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
	[self setMinimumNumberOfSides:min];
	[self setMaximumNumberOfSides:max];
	[self setNumberOfSides:sides];
	return self;
}
- (NSString *)description {
	return [NSString stringWithFormat:@"Hello I am a %d-sided polygon (aka a %@) with angles of %f degrees (%f radians).", 
			[self numberOfSides],
			[self name],
			[self angleInDegrees],
			[self angleInRadians]];
}

- (void)dealloc {
	NSLog(@"Deallocating PolygonShape: %@", [self hash]);
	[super dealloc];
}




@end
