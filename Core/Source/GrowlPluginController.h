//
//  GrowlPluginController.h
//  Growl
//
//  Created by Nelson Elhage on 8/25/04.
//  Copyright 2004-2006 The Growl Project. All rights reserved.
//
// This file is under the BSD License, refer to License.txt for details

#import <Foundation/Foundation.h>
#import "GrowlAbstractSingletonObject.h"

@class GrowlPlugin, GrowlDisplayPlugin;
@class GrowlNonCopyingMutableDictionary;

/*GrowlPluginController handles three types of plug-ins by itself:
 *	*	.growlPlugin (a so-called 'functional plug-in', which adds features to Growl)
 *	*	.growlView (display plug-in)
 *	*	.growlPathway (functional plug-in which adds one or more pathways)
 *
 *in addition, .growlStyle plug-ins are handled by a separate Growl component,
 *	the Growl XXX (need to fill in a class name here).
 *
 *GrowlPluginController allows functional plug-ins to have their own plug-ins.
 *	your plug-in registers a plug-in handler with the GPC, for one or more
 *	types (HFS file types or filename extensions; these can be mixed).
 *when GrowlPluginController moves to load a plug-in of a specific type, it
 *	first tries its built-in handlers (listed above), then searches its
 *	registered plug-in handlers for matches to the plug-in's HFS type and
 *	filename extension.
 *it tries each match in turn, in no guaranteed order. the first one to
 *	successfully load the plug-in wins.
 */

@protocol GrowlPluginHandler <NSObject>

/*no required methods at this time (although there is a set of methods that you
 *	must implement one of; see below).
 *currently, this protocol mainly exists for code self-documentation. but you
 *	should still use it, regardless of whether you find that important.
 */

@end

/*
 *every plug-in handler must have at least one of these three methods:
 *	*	- (BOOL)loadPluginWithBundle:(NSBundle *)bundle;
 *	*	- (BOOL)loadPluginAtPath:(NSString *)path;
 *	*	- (BOOL)loadPluginAtURL:(NSURL *)URL;
 *
 *-loadPluginWithBundle: is preferred. URL will always be a file: URL. there is
 *	no guaranteed preference between path or URL. the methods are currently
 *	tried in this order:
 *	*	bundle (if an NSBundle can be created for the plug-in)
 *	*	path (if no NSBundle could be created, or if the bundle method did not exist or returned NO)
 *	*	URL (if the path method did not exist or returned NO)
 *
 *you must register your plug-in handler for a set of types. each type may be
 *	either an HFS file type (e.g. 'DISP') or a filename extension (e.g.
 *	'growlView').
 *
 *your -loadPlugin... method is responsible for calling
 *	-addPluginInstance:fromBundle: or -addPluginInstance:fromPath: at least
 *	once. if you use the fromBundle: method, and the bundle's principal class
 *	is a subclass of GrowlPlugin, and you pass nil as the plug-in instance,
 *	then the instance will be created lazily when needed.
 *
 *your plug-in handler may also support any of these methods:
 *	*	- (void)growlPluginControllerWillAddPluginHandler:(NSNotification *);
 *	*	- (void)growlPluginControllerDidAddPluginHandler:(NSNotification *);
 *	*	- (void)growlPluginControllerWillRemovePluginHandler:(NSNotification *);
 *	*	- (void)growlPluginControllerDidRemovePluginHandler:(NSNotification *);
 *
 *these map to the notifications (posted on the default notification center):
 *	*	- GrowlPluginControllerWillAddPluginHandlerNotification
 *	*	- GrowlPluginControllerDidAddPluginHandlerNotification
 *	*	- GrowlPluginControllerWillRemovePluginHandlerNotification
 *	*	- GrowlPluginControllerDidRemovePluginHandlerNotification
 *for all of these notifications, the object is the GrowlPluginController
 *	singleton, and the userInfo dictionary contains the following keys:
 *	*	GrowlPluginHandler
 *		the GrowlPluginHandler being added/removed.
 *
 *---
 *
 *plug-ins are identified by the intersection of plug-in name and author name.
 *if a plug-in is opened with the same name and author as an existing plug-in,
 *	its version (if any) is checked against the new version (if any), and the
 *	newer version supplants the older one. (note: as of Tiger, bundle unloading
 *	doesn't work, so GHA will be restarted in order to effect this.)
 *
 *the plug-in's name and author are obtained from its GrowlPlugin instance.
 *	every loaded plug-in must have one, or it isn't a loaded plug-in.
 *plug-ins may create GrowlPlugin instances for their own plug-ins (WebKit
 *	display plug-ins, for example).
 */

extern NSString *GrowlPluginControllerWillAddPluginHandlerNotification;
extern NSString *GrowlPluginControllerDidAddPluginHandlerNotification;
extern NSString *GrowlPluginControllerWillRemovePluginHandlerNotification;
extern NSString *GrowlPluginControllerDidRemovePluginHandlerNotification;

//Info.plist keys for plug-in bundles. also used in plug-in description dictionaries.
extern NSString *GrowlPluginInfoKeyName;
extern NSString *GrowlPluginInfoKeyAuthor;
extern NSString *GrowlPluginInfoKeyVersion;
extern NSString *GrowlPluginInfoKeyDescription;
extern NSString *GrowlPluginInfoKeyBundle;               //description dicts only
extern NSString *GrowlPluginInfoKeyPath;                //description dicts only
extern NSString *GrowlPluginInfoKeyTypes;              //description dicts only - NSSet of NSStrings
extern NSString *GrowlPluginInfoKeyHumanReadableName; //description dicts only
extern NSString *GrowlPluginInfoKeyIdentifier;       //description dicts only
extern NSString *GrowlPluginInfoKeyInstance;        //description dicts only

//convenience accessors, wrapping various objectForKey: calls.
@interface NSDictionary (GrowlPluginKeys)

- (NSString *) pluginName;
- (NSString *) pluginAuthor;
- (NSString *) pluginDescription;
- (NSString *) pluginVersion;
- (NSBundle *) pluginBundle;
- (NSString *) pluginPath;
- (NSSet *) pluginTypes;
- (NSString *) pluginHumanReadableName;
- (NSString *) pluginIdentifier;
- (GrowlPlugin *) pluginInstance;

@end

@interface GrowlPluginController : GrowlAbstractSingletonObject <GrowlPluginHandler> {
	//keys: plug-in IDs; values: plug-in description dictionaries.
	NSMutableDictionary       *pluginsByIdentifier;
	//keys: plug-in paths/bundles/instances; values: plug-in identifiers.
	NSMutableDictionary       *pluginIdentifiersByPath;
	GrowlNonCopyingMutableDictionary *pluginIdentifiersByBundle;
	GrowlNonCopyingMutableDictionary *pluginIdentifiersByInstance;
	//keys: plug-in IDs/names/authors/versions/types/instances; values: NSSets of plug-in description dictionaries.
	NSMutableDictionary *pluginsByName;
	NSMutableDictionary *pluginsByAuthor;
	NSMutableDictionary *pluginsByVersion;
	NSMutableDictionary *pluginsByFilename;
	NSMutableDictionary *pluginsByType;
	//used for triple-disambiguated names (e.g. 'Smoke (by Matthew Walton, filename Smoke.growlView)'). multiple equal names become '...', '... 2', '... 3', etc.
	NSCountedSet          *pluginHumanReadableNames;

	NSMutableSet *bundlesToLazilyInstantiateAnInstanceFrom;
	//GrowlDisplayPlugin instances that have been added as display plugins.
	//these two arrays are parallel.
	NSMutableArray *displayPlugins;
	
	//these string names are used for the user-visible list
	NSMutableArray *disabledPlugins;

	//keys: file types (extensions and HFS types); values: NSArrays of GrowlPluginHandlers.
	NSMutableDictionary        *pluginHandlers;
	/*all registered handlers, in order of when registered. used to determine
	 *	the order in which handlers are invoked on plug-ins.
	 */
	NSMutableArray *allPluginHandlers;
	/*this dictionary records the handler that was used to load each loaded
	 *	plug-in, so that when the plug-in is unloaded, the appropriate handler
	 *	can be called upon to do that.
	 */
	//keys: GrowlPlugins; values: GrowlPluginHandlers
	GrowlNonCopyingMutableDictionary *handlersForPlugins;

	/*these are types for which it is illegal to try and register a plug-in
	 *	handler, because they are reserved for built-in handlers.
	 */
	NSSet *builtInTypes;
		
	//cached attributes.
	//key: PH: plug-in handler; P: plug-in; DP: display plug-in
	//meaning for each of these: invalidated whenever a X is removed
	//e.g.: PH = invalidated whenever a plug-in handler is added or removed
	NSSet *cache_allPlugins; //P
	NSArray *cache_allPluginsArray; //P
	NSSet *cache_registeredPluginTypes; //PH
	NSSet *cache_registeredPluginNames; //P
	NSArray *cache_registeredPluginNamesArray; //P
	NSArray *cache_allPluginInstances; //P
	NSArray *cache_displayPlugins; //DP
	//no cache for displayPluginNames; see -displayPluginNames for why.
}

+ (GrowlPluginController *) sharedController;

#pragma mark - 

- (NSArray *) disabledPlugins;
- (BOOL) disabledPluginsPresent;

#pragma mark -

- (void) addPluginHandler:(id <GrowlPluginHandler>)handler forPluginTypes:(NSSet *)types;
//pass nil to unregister for all path extensions for which the handler is currently registered.
- (void) removePluginHandler:(id <NSObject>)handler forPluginTypes:(NSSet *)types;

#pragma mark -

/*add a plug-in instance. this is the last step in loading a plug-in.
 *call this method from the plug-in handler.
 *the Right Thing will be done when pluginInstance is a GrowlDisplayPlugin
 *	(remember that GrowlDisplayPlugin is a subclass of GrowlPlugin).
 *if you're using the fromBundle: method, you can pass nil as the instance, and
 *	the plug-in will be instantiated lazily. this is preferred.
 *returns the plug-in description dictionary.
 */
- (NSDictionary *) addPluginInstance:(GrowlPlugin *)pluginInstance fromBundle:(NSBundle *)bundle;
- (NSDictionary *) addPluginInstance:(GrowlPlugin *)pluginInstance fromPath:(NSString *)path;

#pragma mark -

/*files or bundles with a pathname extension or HFS file type in this set are
 *	plug-ins that the plug-in controller believes it can load.
 *the contents of the set are the union of:
 *	*	the built-in plug-in types.
 *	*	types that are registered to a GrowlPluginHandler.
 */
- (NSSet *) registeredPluginTypes;

/*human-readable names of all plug-ins.
 *by human-readable, we mean that when two plug-ins have the same name, they
 *	will be identified as 'Name (Author) Version'. the version is in case the
 *	author name had a typo in an earlier version, so the user knows which one
 *	to remove.
 *the array is not guaranteed to be in any order.
 *if you want all the names, without any disambiguation, get all the plug-in
 *	instances (-allPluginInstances) and enumerate them.
 */
- (NSSet *) registeredPluginNames;
- (NSArray *) registeredPluginNamesArray;
- (NSArray *) registeredPluginNamesArrayForType:(NSString *)type;

#pragma mark -

- (NSSet *) allPluginDictionaries;
- (NSArray *) allPluginDictionariesArray;
- (NSArray *) allPluginInstances;

/*the 'type' argument to these search methods takes a filename extension or
 *	HFS type. the list of loaded plug-ins is filtered by it using their path.
 *
 *if you pass nil for the version, the single-result methods will return the
 *	latest match.
 *
 *in the event of no match, the multiple-result method will return an empty
 *	set, while the single-result method will return nil.
 */
- (NSSet *) pluginDictionariesWithName:(NSString *)name author:(NSString *)author version:(NSString *)version type:(NSString *)type;
- (NSDictionary *) pluginDictionaryWithName:(NSString *)name author:(NSString *)author version:(NSString *)version type:(NSString *)type;
//convenience method that calls the previous method with nil for all params except name
- (NSDictionary *) pluginDictionaryWithName:(NSString *)name;
//if a bundle has been marked for lazy loading (no existing instance), this will instantiate its principal class and return that instance.
- (GrowlPlugin *) pluginInstanceWithName:(NSString *)name author:(NSString *)author version:(NSString *)version type:(NSString *)type;
//convenience method that calls the previous method with nil for all params except name
- (GrowlPlugin *) pluginInstanceWithName:(NSString *)name;

#pragma mark -

- (NSString *) humanReadableNameForPluginWithDictionary:(NSDictionary *)pluginDict;
- (BOOL) pluginWithDictionaryIsDisplayPlugin:(NSDictionary *)pluginDict;

#pragma mark -

/*the same as above, but only GrowlDisplayPlugins are returned.
 *
 *given the same input, if -pluginInstanceWithName:author:version:type: returns
 *	an instance that is not a GrowlDisplayPlugin,
 *	-displayPluginInstanceWithName:author:version:type: will return nil.
 */

//returns description dictionaries for all registered display plug-ins (WebKit and Obj-C both).
- (NSArray *) displayPlugins;

//search methods; same as above, but all matched instances are also tested for GrowlDisplayPlugin nature, with only positive results kept in the set.
- (NSSet *) displayPluginDictionariesWithName:(NSString *)name author:(NSString *)author version:(NSString *)version type:(NSString *)type;
- (NSDictionary *) displayPluginDictionaryWithName:(NSString *)name author:(NSString *)author version:(NSString *)version type:(NSString *)type;
//if a bundle has been marked for lazy loading (no existing instance), this will instantiate its principal class and return that instance.
- (GrowlDisplayPlugin *) displayPluginInstanceWithName:(NSString *)name author:(NSString *)author version:(NSString *)version type:(NSString *)type;

#pragma mark -

//dispatches plug-in to plug-in handlers
- (void) dispatchPluginAtPath:(NSString *)path;

//installs plug-in to a plug-ins folder
- (void) installPluginFromPath:(NSString *)path;


- (NSArray *) allPluginHandlers;

@end
