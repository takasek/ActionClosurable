#
# Be sure to run `pod lib lint ActionClosurable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ActionClosurable"
  s.version          = "1.2.0"
  s.summary          = "Extensions which helps to convert swifty closure to objc-style target/action."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.homepage         = "https://github.com/takasek/ActionClosurable"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "takasek" => "takassekiyoshi@gmail.com" }
  s.source           = { :git => "https://github.com/takasek/ActionClosurable.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/takasek'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ActionClosurable/*.swift'
  s.swift_version    = "4.2"

end
