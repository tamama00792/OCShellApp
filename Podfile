# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'OCShellApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  # 如果不添加这句话，那么组件内OC调用Swift必须要使用#import "XXX-Swift.h"的形式引用，而不是#import <XXX/XXX-Swift.h>的形式引用。
  # 且组件间OC调用Swift必须要用@XXX的形式引用
  use_frameworks!

  # Pods for OCShellApp
#  pod 'SwiftMixObjectiveCModule', :path => '../SwiftMixObjectiveCModule'
  pod 'SwiftMixObjectiveCModule', :git => 'git@github.com:tamama00792/SwiftMixObjectiveCModule.git', :branch => 'develop'
#  pod 'SwiftModule', :path => '../SwiftModule'
  pod 'SwiftModule', :git => 'git@github.com:tamama00792/SwiftModule.git', :branch => 'develop'
#  pod 'ObjectiveCModule', :path => '../ObjectiveCModule'
  pod 'ObjectiveCModule', :git => 'git@github.com:tamama00792/ObjectiveCModule.git', :branch => 'develop'
end

