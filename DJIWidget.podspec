#
#  Be sure to run `pod spec lint DJI-SDK-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "DJIWidget"
  s.version      = "1.6.7"
  s.summary      = "DJIWidget for DJI iOS Mobile SDK"
  s.homepage     = "https://github.com/dji-sdk/DJIWidget"
  s.license      = { :type => 'CUSTOM', :file => 'LICENSE.txt' }
  s.author       = { "DJI SDK" => "dev@dji.com" }
  s.source       = { :git => 'https://github.com/dji-sdk/DJIWidget.git', :tag => s.version.to_s, :submodules => true }
  s.requires_arc = true
  s.platform     = :ios, '9.0'
  s.source_files = 'DJIWidget/**/*.{h,m,c}'
  s.ios.public_header_files = 'DJIWidget/**/*.{h}'
  s.ios.vendored_frameworks = 'FFmpeg/FFmpeg.framework'
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"$(PODS_ROOT)/DJIWidget/FFmpeg/FFmpeg.framework/Headers" "$(PODS_ROOT)/Headers/Public/DJIWidget/FFmpeg/.."/**', 'OTHER_LDFLAGS' => '"$(inherited)" -framework "FFmpeg"'}
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64 armv7 i386', "EXCLUDED_ARCHS[sdk=iphoneos*]" => "x86_64 armv7 i386"}
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64 armv7 i386', "EXCLUDED_ARCHS[sdk=iphoneos*]" => "x86_64 armv7 i386"}

end
