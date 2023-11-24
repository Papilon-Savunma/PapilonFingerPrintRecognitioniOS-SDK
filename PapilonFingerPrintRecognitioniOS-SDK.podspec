Pod::Spec.new do |s|
  s.name             = 'PapilonFingerPrintRecognitioniOS-SDK'
  s.version          = '1.0.0'
  s.summary          = 'Library for fingerprint detection from the device camera'

  s.homepage         = 'https://github.com/Papilon-Savunma/PapilonFingerPrintRecognitioniOS-SDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '' => '' }
  
  s.platform          = :ios
  s.source = { :git => 'https://github.com/Papilon-Savunma/PapilonFingerPrintRecognitioniOS-SDK.git', :tag => s.version.to_s }
  s.ios.deployment_target = '14.0'
  s.swift_versions = '5.0'
  s.vendored_frameworks = 'PapilonFingerTipDetection.xcframework'
end
