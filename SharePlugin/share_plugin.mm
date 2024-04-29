//
// © 2024-present https://github.com/cengiz-pz
//

#import <Foundation/Foundation.h>

#import "share_plugin.h"
#import "share_plugin_implementation.h"

#import "core/config/engine.h"


SharePlugin *plugin;

void share_plugin_init() {
	NSLog(@"init plugin");

	plugin = memnew(SharePlugin);
	Engine::get_singleton()->add_singleton(Engine::Singleton("SharePlugin", plugin));
}

void share_plugin_deinit() {
	NSLog(@"deinit plugin");
	
	if (plugin) {
	   memdelete(plugin);
   }
}
