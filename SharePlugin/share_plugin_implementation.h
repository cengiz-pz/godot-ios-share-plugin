//
// © 2024-present https://github.com/cengiz-pz
//

#ifndef share_plugin_implementation_h
#define share_plugin_implementation_h

#include "core/object/object.h"
#include "core/object/class_db.h"

extern String const DATA_KEY_TITLE;
extern String const DATA_KEY_SUBJECT;
extern String const DATA_KEY_CONTENT;
extern String const DATA_KEY_IMAGE_PATH;

extern String const SIGNAL_NAME_SHARE_COMPLETED;


class SharePlugin : public Object {
	GDCLASS(SharePlugin, Object);
	
	static void _bind_methods();

	static NSString* toNsString(const String &godotString);
	
public:

	Error share(const Dictionary &sharedData);
	
	SharePlugin();
	~SharePlugin();
};

#endif /* share_plugin_implementation_h */
