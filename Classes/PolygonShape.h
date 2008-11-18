//
//  PolygonShape.h
//  WhatATool
//
//  Created by John Reilly on 11/16/08.
//  Copyright 2008 Tightrope Media Systems. All rights reserved.
//




@interface PolygonShape : NSObject {
	
	int numberOfSides;
	int maximumNumberOfSides;
	int minimumNumberOfSides;
}

@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;
@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;
@property (readonly) NSString *name;

- (id)init;
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max; 

@end
