#
# Be sure to run `pod lib lint FOBKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FOBKit"
  s.version          = "0.1.0"
  s.summary          = "Common code for the iOS app and the extensions will live here. i.e. business logic"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
this app is a test app to display a use of the Today Extension for an iOS app.  Also, an application of building out a library for easy reuse.  FOBKit is that library.
                       DESC

  s.homepage         = "https://github.com/<GITHUB_USERNAME>/FOBKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Boomesh Bohn" => "sumesh@weareintersect.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/FOBKit.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FOBKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FOBKit' => ['FOBKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
