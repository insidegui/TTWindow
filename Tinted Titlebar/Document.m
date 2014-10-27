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

@property (weak) IBOutlet NSColorWell *colorWell;

@end

@implementation Document

- (IBAction)colorWellAction:(id)sender {
    TTWindow *tintedTitlebarWindow = (TTWindow *)self.windowForSheet;
    tintedTitlebarWindow.titlebarTintColor = self.colorWell.color;
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
