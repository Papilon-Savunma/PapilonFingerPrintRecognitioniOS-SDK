# PapilonFingerPrintRecognitioniOS-SDK

[![pod - 1.0.3](https://img.shields.io/badge/pod-1.0.2-blue)](https://cocoapods.org/)

## Requirements

- +iOS 14.0

## Installation

PapilonFingerPrintRecognitioniOS-SDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following lines to your Podfile:

```ruby
use_frameworks!

platform :ios, '14.0'

target 'FingerprintDemoApp' do
  pod 'PapilonFingerPrintRecognitioniOS-SDK'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
```

## Important Notes

If you are using XCode version 14.3.1 for your development, you can directly pull and use the updated SDK with a 'pod update' command.

However, if you have upgraded to XCode version 15.0, you may encounter the following error when building after 'pod update':
<br>
<b>DT_TOOLCHAIN_DIR cannot be used to evaluate LIBRARY_SEARCH_PATHS, use TOOLCHAIN_DIR instead</b>

Until Apple or CocoaPods releases a new update related to this issue, as a temporary solution after every 'pod update,' please follow these steps in the terminal inside your project folder:
Run the following script:

```bash
find . -name "*.xcconfig" -type f -exec grep -l 'DT_TOOLCHAIN_DIR' {} \; | while IFS= read -r file; do sed -i '' 's/DT_TOOLCHAIN_DIR/TOOLCHAIN_DIR/g' "$file"; done
```

Then, reopen the project and build it again. After this step, you may encounter a runtime error like the following:
<br>
<b>Sandbox: rsync(35790) deny(1) file-write-create</b>

For that, you can follow these steps:

Open the Xcode project.<br>
Click on the project name in the left sidebar to open the project settings.<br>
Select the target you want to check in the "Targets" section.<br>
Click on the "Build Settings" tab.<br>
In the search bar, type "ENABLE_USER_SCRIPT_SANDBOXING."<br>
If the value of ENABLE_USER_SCRIPT_SANDBOXING is set to "No," then it is disabled. If it is set to "Yes," then it is enabled.

## Configuration

- Add your Info.plist file necessary permissions;

  ```
    <key>NSCameraUsageDescription</key>
    <string>We need access to your camera to detect finger tips.</string>
  ```

- Initializing the SDK

```swift
// Initialize the FingerTipDetection instance
fingerTipDetection = FingerTipDetection(
    token: "YOUR_TOKEN",
    licenceID: "YOUR_ID",
    parentView: self.view)
fingerTipDetection?.delegate = self
```
