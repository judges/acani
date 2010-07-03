/*
     File: QuartzPolygons.m
 Abstract: Demonstrates using Quartz to stroke & fill rectangles (QuartzRectView) and polygons (QuartzPolygonView).
  Version: 2.3
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2010 Apple Inc. All Rights Reserved.
 
*/

#import "QuartzPolygons.h"

@implementation QuartzRectView

-(void)drawInContext:(CGContextRef)context
{
	// Drawing with a white stroke color
	CGContextSetRGBStrokeColor(context, 0.0, 1.0, 0.0, 1.0);
	// And drawing with a green fill color
	CGContextSetRGBFillColor(context, 0.0, 1.0, 1.0, 1.0);
	// Draw them with a 2.0 stroke width so they are a bit more visible.
	CGContextSetLineWidth(context, 2.0);
	
	// Add Rect to the current path, then stroke it
	CGContextAddRect(context, CGRectMake(30.0, 30.0, 60.0, 60.0));
	CGContextStrokePath(context);
	
	// Stroke Rect convenience that is equivalent to above
	CGContextStrokeRect(context, CGRectMake(30.0, 120.0, 60.0, 60.0));
	
	// Stroke rect convenience equivalent to the above, plus a call to CGContextSetLineWidth().
	CGContextStrokeRectWithWidth(context, CGRectMake(30.0, 210.0, 60.0, 60.0), 10.0);
	// Demonstate the stroke is on both sides of the path.
	CGContextSaveGState(context);
	CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
	CGContextStrokeRectWithWidth(context, CGRectMake(30.0, 210.0, 60.0, 60.0), 2.0);
	CGContextRestoreGState(context);
	
	CGRect rects[] = 
	{
		CGRectMake(120.0, 30.0, 60.0, 60.0),
		CGRectMake(120.0, 120.0, 60.0, 60.0),
		CGRectMake(120.0, 210.0, 60.0, 60.0),
	};
	// Bulk call to add rects to the current path.
	CGContextAddRects(context, rects, sizeof(rects)/sizeof(rects[0]));
	CGContextStrokePath(context);
	
	// Create filled rectangles via two different paths.
	// Add/Fill path
	CGContextAddRect(context, CGRectMake(210.0, 30.0, 60.0, 60.0));
	CGContextFillPath(context);
	// Fill convienience.
	CGContextFillRect(context, CGRectMake(210.0, 120.0, 60.0, 60.0));
}

@end

@implementation QuartzPolygonView

@synthesize drawingMode;

-(void)setDrawingMode:(CGPathDrawingMode)mode
{
	if(mode != drawingMode)
	{
		drawingMode = mode;
		[self setNeedsDisplay];
	}
}

-(void)drawInContext:(CGContextRef)context
{
	// Drawing with a white stroke color
	CGContextSetRGBStrokeColor(context, 0.0, 1.0, 1.0, 1.0);
	// Drawing with a green fill color
	CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);
	// Draw them with a 2.0 stroke width so they are a bit more visible.
	CGContextSetLineWidth(context, 2.0);

	CGPoint center;

	// Add a star to the current path
	center = CGPointMake(90.0, 90.0);
	CGContextMoveToPoint(context, center.x, center.y + 60.0);
	for(int i = 1; i < 5; ++i)
	{
		CGFloat x = 60.0 * sinf(i * 4.0 * M_PI / 5.0);
		CGFloat y = 60.0 * cosf(i * 4.0 * M_PI / 5.0);
		CGContextAddLineToPoint(context, center.x + x, center.y + y);
	}
	// And close the subpath.
	CGContextClosePath(context);

	// Now add the hexagon to the current path
	center = CGPointMake(210.0, 90.0);
	CGContextMoveToPoint(context, center.x, center.y + 60.0);
	for(int i = 1; i < 6; ++i)
	{
		CGFloat x = 60.0 * sinf(i * 2.0 * M_PI / 6.0);
		CGFloat y = 60.0 * cosf(i * 2.0 * M_PI / 6.0);
		CGContextAddLineToPoint(context, center.x + x, center.y + y);
	}
	// And close the subpath.
	CGContextClosePath(context);
	
	// Now draw the star & hexagon with the current drawing mode.
	CGContextDrawPath(context, drawingMode);
}

@end


#pragma mark -

@implementation QuartzRectPDFView

-(id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if(self != nil)
	{
		CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("QuartzRect.pdf"), NULL, NULL);
		pdf = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
		CFRelease(pdfURL);
	}
	return self;
}

-(void)dealloc
{
	CGPDFDocumentRelease(pdf);
	[super dealloc];
}

-(void)drawInContext:(CGContextRef)context
{
	// PDF page drawing expects a Lower-Left coordinate system, so we flip the coordinate system
	// before we start drawing.
	CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	// Grab the first PDF page
	CGPDFPageRef page = CGPDFDocumentGetPage(pdf, 1);
	// We're about to modify the context CTM to draw the PDF page where we want it, so save the graphics state in case we want to do more drawing
	CGContextSaveGState(context);
	// CGPDFPageGetDrawingTransform provides an easy way to get the transform for a PDF page. It will scale down to fit, including any
	// base rotations necessary to display the PDF page correctly. 
	CGAffineTransform pdfTransform = CGPDFPageGetDrawingTransform(page, kCGPDFCropBox, self.bounds, 0, true);
	// And apply the transform.
	CGContextConcatCTM(context, pdfTransform);
	// Finally, we draw the page and restore the graphics state for further manipulations!
	CGContextDrawPDFPage(context, page);
	CGContextRestoreGState(context);
}

@end


#pragma mark -

@implementation QuartzPolyViewPDFView

-(id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if(self != nil)
	{
		CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("QuartzPoly.pdf"), NULL, NULL);
		pdf = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
		CFRelease(pdfURL);
	}
	return self;
}

-(void)dealloc
{
	CGPDFDocumentRelease(pdf);
	[super dealloc];
}

-(void)drawInContext:(CGContextRef)context
{
	// PDF page drawing expects a Lower-Left coordinate system, so we flip the coordinate system
	// before we start drawing.
	CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	// Grab the first PDF page
	CGPDFPageRef page = CGPDFDocumentGetPage(pdf, 1);
	// We're about to modify the context CTM to draw the PDF page where we want it, so save the graphics state in case we want to do more drawing
	CGContextSaveGState(context);
	// CGPDFPageGetDrawingTransform provides an easy way to get the transform for a PDF page. It will scale down to fit, including any
	// base rotations necessary to display the PDF page correctly. 
	CGAffineTransform pdfTransform = CGPDFPageGetDrawingTransform(page, kCGPDFCropBox, self.bounds, 0, true);
	// And apply the transform.
	CGContextConcatCTM(context, pdfTransform);
	// Finally, we draw the page and restore the graphics state for further manipulations!
	CGContextDrawPDFPage(context, page);
	CGContextRestoreGState(context);
}

@end



