#
# Be sure to run `pod lib lint SeedCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SeedCategory'
  s.version          = '0.0.5'
  s.summary          = 'Objective-C 常用分类'
  s.homepage         = 'https://github.com/GuanQinghao/SeedCategory'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'GuanQinghao' => 'qinghaoguan@163.com' }
  s.source           = { :git => 'https://github.com/GuanQinghao/SeedCategory.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'SeedCategory/Classes/**/*'
  s.dependency 'MBProgressHUD'
  
  # s.resource_bundles = {
  #   'SeedCategory' => ['SeedCategory/Assets/*.png']
  # }
  # s.frameworks = 'UIKit', 'MapKit'
   
end
