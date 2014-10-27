//
//  TTColorView.m
//  Tinted Titlebar
//
//  Created by Guilherme Rambo on 27/10/14.
//  Copyright (c) 2014 Guilherme Rambo. All rights reserved.
//

#import "TTColorView.h"

@implementation TTColorView

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
    
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    if (self.backgroundColor) {
        [self.backgroundColor setFill];
    } else {
        [[NSColor redColor] setFill];
    }
    
    NSRectFill(dirtyRect);
}

@end
