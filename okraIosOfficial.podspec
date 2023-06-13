#
# Be sure to run `pod lib lint okraIosOfficial.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'okraIosOfficial'
  s.version          = '0.1.0'
  s.summary          = 'This is the Okra IOS official SDK.'
  s.swift_versions = ['4.0']

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'This is the Okra IOS official SDK. Supports SwiftUI'

  s.homepage         = 'https://github.com/okraHQ/okra-ios-official'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nzeakokosi7' => 'nzeakokosi7@gmail.com' }
  s.source           = { :git => 'https://github.com/okraHq/okra-ios-official.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'okraIosOfficial/Classes/**/*'
  
  # s.resource_bundles = {
  #   'okraIosOfficial' => ['okraIosOfficial/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'DeviceKit', '~> 4.0'
end
