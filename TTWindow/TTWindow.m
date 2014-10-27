//
//  TTWindow.m
//  Tinted Titlebar
//
//  Created by Guilherme Rambo on 27/10/14.
//  Copyright (c) 2014 Guilherme Rambo. All rights reserved.
//

#import "TTWindow.h"
#import "TTColorView.h"

#define kTTWindowDefaultTitlebarTintColor [NSColor greenColor]

@interface TTWindow ()

@property (nonatomic, strong) TTColorView *tintView;

@end

@implementation TTWindow

- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    self = [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:flag];
    
    if (!self) return nil;
    
    self.titlebarTintColor = kTTWindowDefaultTitlebarTintColor;
    
    [self setupTitlebarTint];
    
    return self;
}

- (void)setupTitlebarTint
{
    for (id view in [[self.contentView superview] subviews]) {
        if ([view isKindOfClass:NSClassFromString(@"NSTitlebarContainerView")]) {
            self.tintView = [[TTColorView alloc] initWithFrame:NSMakeRect(0, 0, NSWidth([view frame]), NSHeight([view frame]))];
            self.tintView.autoresizingMask = NSViewWidthSizable|NSViewHeightSizable;
            self.tintView.backgroundColor = self.titlebarTintColor;
            [view addSubview:self.tintView positioned:NSWindowBelow relativeTo:[view subviews][0]];
        }
    }
}

- (void)setTitlebarTintColor:(NSColor *)titlebarTintColor
{
    if (titlebarTintColor == _titlebarTintColor) return;
    
    _titlebarTintColor = titlebarTintColor;
    
    self.tintView.backgroundColor = _titlebarTintColor;
}

@end
