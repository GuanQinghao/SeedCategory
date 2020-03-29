#
# Be sure to run `pod lib lint SeedCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SeedCategory'
  s.version          = '0.0.2'
  s.summary          = '常用分类.'
  s.description      = <<-DESC
常用分类
                       DESC

  s.homepage         = 'https://github.com/GuanQinghao/SeedCategory'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'GuanQinghao' => 'qinghaoguan@163.com' }
  s.source           = { :git => 'https://github.com/GuanQinghao/SeedCategory.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '10.0'
  s.source_files = 'SeedCategory/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SeedCategory' => ['SeedCategory/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
