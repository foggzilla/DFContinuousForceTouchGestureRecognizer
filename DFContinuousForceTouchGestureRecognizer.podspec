#
# Be sure to run `pod lib lint DFContinuousForceTouchGestureRecognizer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DFContinuousForceTouchGestureRecognizer"
  s.version          = "0.1.0"
  s.summary          = "Extension of UIGestureRecognizer that recognizes a force touch gesture and provides continuous updates regarding touch force changes."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "iOS Force Touch gesture recognizer that will stream force updates to the delegate for the user's finger pressure changes. It gives you the capability to detect force touch and monitor pressure changes on a view in order to adapt your ui for an added dimension of interaction. This is only useful for running on a physical device that supports force touch."

  s.homepage         = "https://github.com/foggzilla/DFContinuousForceTouchGestureRecognizer"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Daniel Fogg" => "danielj_fogg@yahoo.com" }
  s.source           = { :git => "https://github.com/foggzilla/DFContinuousForceTouchGestureRecognizer.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DFContinuousForceTouchGestureRecognizer' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
