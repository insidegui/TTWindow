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
    
    // start with the default tint color
    self.titlebarTintColor = kTTWindowDefaultTitlebarTintColor;
    
    [self setupTitlebarTint];
    
    return self;
}

- (void)setupTitlebarTint
{
    // The superview of our contentView is an NSThemeFrame,
    // it has an NSTitlebarContainerView, which contains
    // an NSTitlebarView. The NSTitlebarView has a visual effect,
    // so any view behind It will show through, so we
    // insert our tinted view behind It
    
    // walk through the NSThemeFrame's subviews
    for (id view in [[self.contentView superview] subviews]) {
        // find the NSTitlebarContainerView
        if (![view isKindOfClass:NSClassFromString(@"NSTitlebarContainerView")]) continue;
        
        // initialize the tinted view
        NSRect tintedViewFrame = NSMakeRect(0, 0, NSWidth([view frame]), NSHeight([view frame]));
        self.tintView = [[TTColorView alloc] initWithFrame:tintedViewFrame];
        self.tintView.autoresizingMask = NSViewWidthSizable|NSViewHeightSizable;
        self.tintView.backgroundColor = self.titlebarTintColor;
        
        // add the tinted view behind the first subview of the NSTitlebarContainerView
        [view addSubview:self.tintView positioned:NSWindowBelow relativeTo:[view subviews][0]];
    }
}

- (void)setTitlebarTintColor:(NSColor *)titlebarTintColor
{
    if (titlebarTintColor == _titlebarTintColor) return;
    
    _titlebarTintColor = titlebarTintColor;
    
    self.tintView.backgroundColor = _titlebarTintColor;
}

@end
