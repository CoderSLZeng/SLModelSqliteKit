#
# Be sure to run `pod lib lint SLModelSqliteKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SLModelSqliteKit'
  s.version          = '0.1.0'
  s.summary          = 'Sqlite3封装'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
专业数据模型存储解决方案(告别直接使用sqlite和coreData)
                       DESC

  s.homepage         = 'https://github.com/CoderSLZeng/SLModelSqliteKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CoderSLZeng' => '359297567@qq.com' }
  s.source           = { :git => 'https://github.com/CoderSLZeng/SLModelSqliteKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SLModelSqliteKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SLModelSqliteKit' => ['SLModelSqliteKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
