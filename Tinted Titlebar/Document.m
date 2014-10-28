//
//  Document.m
//  Tinted Titlebar
//
//  Created by Guilherme Rambo on 27/10/14.
//  Copyright (c) 2014 Guilherme Rambo. All rights reserved.
//

#import "Document.h"
#import "TTWindow.h"

@interface Document ()

@property (readonly) TTWindow *specialWindow;
@property (weak) IBOutlet NSColorWell *colorWell;

@end

@implementation Document

- (TTWindow *)specialWindow
{
    return (TTWindow *)self.windowForSheet;
}

- (IBAction)colorWellAction:(id)sender {
    self.specialWindow.titlebarTintColor = self.colorWell.color;
}

- (IBAction)checkboxAction:(id)sender {
    if ([sender state] == NSOnState) {
        self.specialWindow.titlebarEffectState = NSVisualEffectStateActive;
    } else {
        self.specialWindow.titlebarEffectState = NSVisualEffectStateFollowsWindowActiveState;
    }
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    
    self.windowForSheet.backgroundColor = [NSColor whiteColor];
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (NSString *)windowNibName {
    return @"Document";
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    return [NSData data];
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    return YES;
}

@end
