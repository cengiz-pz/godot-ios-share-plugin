//
// © 2024-present https://github.com/cengiz-pz
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#include "core/config/project_settings.h"

#import "share_plugin_implementation.h"

String const DATA_KEY_TITLE = "title";
String const DATA_KEY_SUBJECT = "subject";
String const DATA_KEY_CONTENT = "content";
String const DATA_KEY_IMAGE_PATH = "image_path";

String const SIGNAL_NAME_SHARE_COMPLETED = "share_completed";


void SharePlugin::_bind_methods() {
	ClassDB::bind_method(D_METHOD("share"), &SharePlugin::share);

	ADD_SIGNAL(MethodInfo(SIGNAL_NAME_SHARE_COMPLETED));
}

Error SharePlugin::share(const Dictionary &sharedData) {
	NSLog(@"SharePlugin::share");

	UIViewController* rootController = [[UIApplication sharedApplication] delegate].window.rootViewController;
	
	NSArray* sharedItems = sharedData.has(DATA_KEY_IMAGE_PATH) ?
				@[toNsString(sharedData[DATA_KEY_CONTENT]), [UIImage imageWithContentsOfFile: toNsString(sharedData[DATA_KEY_IMAGE_PATH])]] :
				@[toNsString(sharedData[DATA_KEY_CONTENT])];
	
	UIActivityViewController* avc = [[UIActivityViewController alloc] initWithActivityItems: sharedItems applicationActivities: nil];
	// if iPhone
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
		[rootController presentViewController: avc animated: YES completion: ^() {
			emit_signal(SIGNAL_NAME_SHARE_COMPLETED);
		}];
	}
	// if iPad
	else {
		// Change Rect to position Popover
		avc.modalPresentationStyle = UIModalPresentationPopover;
		avc.popoverPresentationController.sourceView = rootController.view;
		avc.popoverPresentationController.sourceRect = CGRectMake(CGRectGetMidX(rootController.view.bounds), CGRectGetMidY(rootController.view.bounds),0,0);
		avc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection(0);
		[rootController presentViewController: avc animated: YES completion: ^() {
			emit_signal(SIGNAL_NAME_SHARE_COMPLETED);
		}];
	}

	return OK;
}

NSString* SharePlugin::toNsString(const String &godotString) {
	return [NSString stringWithUTF8String: godotString.utf8().get_data()];
}

SharePlugin::SharePlugin() {
	NSLog(@"SharePlugin constructor");
}

SharePlugin::~SharePlugin() {
	NSLog(@"SharePlugin destructor");
}
