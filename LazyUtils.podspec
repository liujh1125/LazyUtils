#
# Be sure to run `pod lib lint LazyUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LazyUtils'
  s.version          = '0.1.0'
  s.summary          = '懒人快速开发包，集成常用的方法，省时省力，提升效率'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    懒人快速开发包，集成常用的方法，省时省力，提升效率，iOS开发的福音，你们要的偷懒的工具又来了
                       DESC

  s.homepage         = 'https://github.com/liujh1125/LazyUtils'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liujh1125' => 'liujh1125@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/liujh1125/LazyUtils.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LazyUtils/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LazyUtils' => ['LazyUtils/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
