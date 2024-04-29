
---
# ![](addon/icon.png?raw=true) Share Plugin
Godot iOS Share Plugin allows sharing of text and images on the iOS platform.

## ![](addon/icon.png?raw=true) Android Version
Android version of this plugin can be found at the following link:
- https://github.com/cengiz-pz/godot-android-share-plugin

## ![](addon/icon.png?raw=true) Installation
There are 2 ways to install the `Share Plugin` into your project:
- Through the Godot Editor's AssetLib
- Manually by downloading the release archive from Github

### ![](addon/icon.png?raw=true) Steps to install via AssetLib
- search for and select the `iOS Share Plugin` in Godot Editor's AssetLib tab
- click `Download` button
- on the installation dialog...
  - leave your project's root directory selected as the target directory
  - leave `Ignore asset root` checkbox checked
  - click `Install` button
- enable the addon via the `Plugins` tab of `Project->Project Settings...` menu, in the Godot Editor
- enable the plugin in your project's iOS export settings via `Project->Export...->iOS` in the Godot Editor

### ![](addon/icon.png?raw=true) Manual installation steps
- download release archive from Github
- unzip the release archive
- copy contents of the unzipped directory into your project's root directory
- enable the plugin via the `Plugins` tab of `Project->Project Settings...` menu, in the Godot Editor
<br/><br/>

## ![](addon/icon.png?raw=true) Usage
Add a `Share` node to your scene and follow the following steps:
- use one of the following methods of the `Share` node to share text or images:
    - `share_text(title, subject, content)`
    - `share_image(full_path_for_saved_image_file, title, subject, content)`
        - Note that the image you want to share must be saved under the `user://` virtual directory in order to be accessible. The `OS.get_user_data_dir()` method can be used to get the absolute path for the `user://` directory. See the implementation of `share_viewport()` method for sample code.
    - `share_viewport(viewport, title, subject, content)`
<br/><br/><br/>
## ![](addon/icon.png?raw=true) Export to iOS
Follow instructions on the following page to export your project and run on an iOS device:
- [Exporting for iOS](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_ios.html)
<br/><br/><br/>
---
# ![](addon/icon.png?raw=true) Credits
Based on [Shin-NiL](https://github.com/Shin-NiL)'s [Godot Share Plugin](https://github.com/Shin-NiL/Godot-Android-Share-Plugin)

Developed by [Cengiz](https://github.com/cengiz-pz)

Original repository: [Godot iOS Share Plugin](https://github.com/cengiz-pz/godot-ios-share-plugin)

