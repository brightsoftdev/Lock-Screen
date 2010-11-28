//
//  LCYBannerView.m
//  LockScreen
//
//  Created by Krishna Kotecha on 28/11/2010.
//  Copyright 2010 Logic Colony Ltd. All rights reserved.
//

#import "LCYBannerView.h"

const CGFloat kBannerVIewWidth = 320.0f;
const CGFloat kBannerVIewHeight = 95.0f;


@implementation LCYBannerView

@synthesize bannerColor = bannerColor_;

- (void) dealloc
{
	[bannerColor_ release];
	[super dealloc];
}

- (id) initWithCoder: (NSCoder *) coder
{
	self = [super initWithCoder:coder];
	if (self) 
	{
		[self setOpaque:NO];
		
		// use whatever background color has been set in Interface Builder, as
		// the background color for our shiny banner.
		self.bannerColor = self.backgroundColor;
		self.backgroundColor = [UIColor clearColor];
	}
	return self;
}



- (CGSize) sizeThatFits: (CGSize) size;
{
	return CGSizeMake(kBannerVIewWidth, kBannerVIewHeight);
}

- (void) drawRect: (CGRect) dirtyRect;
{
	// Code generated by Opacity
	CGRect imageBounds = CGRectMake(0.0f, 0.0f, kBannerVIewWidth, kBannerVIewHeight);
	CGRect bounds = [self bounds];
	CGContextRef context = UIGraphicsGetCurrentContext();
	UIColor *color;
	CGFloat resolution;
	CGFloat alignStroke;
	CGFloat stroke;
	CGMutablePathRef path;
	CGRect drawRect;
	CGGradientRef gradient;
	NSMutableArray *colors;
	CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
	CGPoint point;
	CGPoint point2;
	CGFloat locations[4];
	resolution = 0.5f * (bounds.size.width / imageBounds.size.width + bounds.size.height / imageBounds.size.height);
	
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, bounds.origin.x, bounds.origin.y);
	CGContextScaleCTM(context, (bounds.size.width / imageBounds.size.width), (bounds.size.height / imageBounds.size.height));
	
	// Setup for Shadow Effect
	color = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
	CGContextSaveGState(context);
	CGContextSetShadowWithColor(context, CGSizeMake(0.0f * resolution, 0.0f * resolution), 5.729f * resolution, [color CGColor]);
	CGContextBeginTransparencyLayer(context, NULL);
	
	// Layer 1
	
	// Button Color
	
	stroke = 1.0f;
	stroke *= resolution;
	if (stroke < 1.0f) {
		stroke = ceilf(stroke);
	} else {
		stroke = roundf(stroke);
	}
	stroke /= resolution;
	alignStroke = fmodf(0.5f * stroke * resolution, 1.0f);
	path = CGPathCreateMutable();
	drawRect = CGRectMake(0.0f, 0.0f, 320.0f, 88.0f);
	drawRect.origin.x = (roundf(resolution * drawRect.origin.x + alignStroke) - alignStroke) / resolution;
	drawRect.origin.y = (roundf(resolution * drawRect.origin.y + alignStroke) - alignStroke) / resolution;
	drawRect.size.width = roundf(resolution * drawRect.size.width) / resolution;
	drawRect.size.height = roundf(resolution * drawRect.size.height) / resolution;
	CGPathAddRect(path, NULL, drawRect);

//	color = [UIColor colorWithRed:0.0f green:0.215f blue:0.588f alpha:1.0f];
	color = bannerColor_;
	[color setFill];
	CGContextAddPath(context, path);
	CGContextFillPath(context);
	color = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.0f];
	[color setStroke];
	CGContextSetLineWidth(context, stroke);
	CGContextSetLineCap(context, kCGLineCapSquare);
	CGContextAddPath(context, path);
	CGContextStrokePath(context);
	CGPathRelease(path);
	
	// Button Shine
	
	stroke = 1.0f;
	stroke *= resolution;
	if (stroke < 1.0f) {
		stroke = ceilf(stroke);
	} else {
		stroke = roundf(stroke);
	}
	stroke /= resolution;
	alignStroke = fmodf(0.5f * stroke * resolution, 1.0f);
	path = CGPathCreateMutable();
	drawRect = CGRectMake(0.0f, 0.0f, 320.0f, 88.0f);
	drawRect.origin.x = (roundf(resolution * drawRect.origin.x + alignStroke) - alignStroke) / resolution;
	drawRect.origin.y = (roundf(resolution * drawRect.origin.y + alignStroke) - alignStroke) / resolution;
	drawRect.size.width = roundf(resolution * drawRect.size.width) / resolution;
	drawRect.size.height = roundf(resolution * drawRect.size.height) / resolution;
	CGPathAddRect(path, NULL, drawRect);
	colors = [NSMutableArray arrayWithCapacity:4];
	color = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.2f];
	[colors addObject:(id)[color CGColor]];
	locations[0] = 1.0f;
	color = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.0f];
	[colors addObject:(id)[color CGColor]];
	locations[1] = 0.75f;
	color = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.0f];
	[colors addObject:(id)[color CGColor]];
	locations[2] = 0.5f;
	color = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.6f];
	[colors addObject:(id)[color CGColor]];
	locations[3] = 0.02f;
	gradient = CGGradientCreateWithColors(space, (CFArrayRef)colors, locations);
	CGContextAddPath(context, path);
	CGContextSaveGState(context);
	CGContextEOClip(context);
	point = CGPointMake(160.0f, 0.0f);
	point2 = CGPointMake(160.0f, 88.0f);
	CGContextDrawLinearGradient(context, gradient, point, point2, (kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation));
	CGContextRestoreGState(context);
	CGGradientRelease(gradient);
	color = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.6f];
	[color setStroke];
	CGContextAddPath(context, path);
	CGContextStrokePath(context);
	CGPathRelease(path);
	
	// Shadow Effect
	CGContextEndTransparencyLayer(context);
	CGContextRestoreGState(context);
	
	CGContextRestoreGState(context);
	CGColorSpaceRelease(space);
}



@end
