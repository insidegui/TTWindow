//
//  TTWindow.h
//  Tinted Titlebar
//
//  Created by Guilherme Rambo on 27/10/14.
//  Copyright (c) 2014 Guilherme Rambo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TTWindow : NSWindow

/*!
 @property titlebarTintColor
 @abstract
 The titlebar tint color
 */
@property (nonatomic, assign) NSColor *titlebarTintColor;

/*!
 @property titlebarEffectState
 @abstract
 NSVisualEffectStateActive - The tint always shows through the titlebar
 NSVisualEffectStateInactive - The tint never shows through the titlebar
 NSVisualEffectStateFollowsWindowActiveState - The tint shows thorugh the titlebar when the window is active
 */
@property (nonatomic, assign) NSVisualEffectState titlebarEffectState;

@end
