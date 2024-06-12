require_relative '../node_modules/react-native/scripts/react_native_pods'
require_relative '../node_modules/@react-native-community/cli-platform-ios/native_modules'

platform :ios, '15.0'
#use_frameworks!

source 'https://github.com/CocoaPods/Specs.git'

def react_native_dependencies
  # use_frameworks!
  config = use_native_modules!
  use_react_native!(:path => config[:reactNativePath], :hermes_enabled => false)
end

target 'ShoppingApp' do
  react_native_dependencies
  target 'ShoppingAppTests' do
    inherit! :search_paths
  end

  target 'ShoppingAppUITests' do
  end
end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
                config.build_settings['SWIFT_SUPPRESS_WARNINGS'] = "YES"
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '17.0'
            end
        end
    end
end
