#
#  Be sure to run `pod spec lint SLConsoleLog.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "SLConsoleLog"
  s.version      = "1.0.5"
  s.summary      = "See all logs in app on real time."
  s.description  = "A great lib for show and manage all logs in the app in real time for QA process."
  s.homepage     = "https://github.com/agustinslions/ManagedLog.git"
  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author       = { "agustinslions" => "agustinslions@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/agustinslions/ManagedLog.git", :tag => "1.0.5" }
  s.source_files = "SLConsoleLog/ConsoleLogs/*.{h,m}"
  s.resources    = "SLConsoleLog/ConsoleLogs/*.xib"
  s.requires_arc = true
end
