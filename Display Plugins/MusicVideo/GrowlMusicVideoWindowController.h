//
//  GrowlMusicVideoWindowController.h
//  Display Plugins
//
//  Created by Jorge Salvador Caffarena on 09/09/04.
//  Copyright 2004 Jorge Salvador Caffarena. All rights reserved.
//

#import "FadingWindowController.h"

@interface GrowlMusicVideoWindowController : FadingWindowController {
	float	frameHeight;
	int		priority;
	NSView	*contentView;
	NSView	*subview;
	NSPoint	frameOrigin;
}

+ (GrowlMusicVideoWindowController *) musicVideoWithTitle:(NSString *)title text:(NSString *)text
		icon:(NSImage *)icon priority:(int)priority sticky:(BOOL)sticky;

- (id) initWithTitle:(NSString *)title text:(NSString *)text icon:(NSImage *)icon priority:(int)priority sticky:(BOOL)sticky;

- (int) priority;
- (void) setPriority:(int)newPriority;

@end
