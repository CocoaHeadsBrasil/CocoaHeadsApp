plugin 'cocoapods-acknowledgements', :settings_bundle => true

def common_pods
    pod 'R.swift', '~> 1.3.0'
    pod 'Unbox', '1.0'
    pod 'Moya', '~> 6.1.3'
    pod 'XCGLogger', '~> 3.2'
    pod 'Nuke', '~> 2.0.1'
    pod 'CPDAcknowledgements', '~> 1.0'
    pod 'DynamicColor', '~> 2.4.0'
    pod 'RxSwift', '~> 2.6.0'
    pod 'RxCocoa'
end

def common_test_pods
    pod 'OHHTTPStubs', '~> 4.7.0'
    pod 'OHHTTPStubs/Swift'
    pod 'Nimble'
    pod 'Quick'
end

platform :ios, '8.0'
use_frameworks!
inhibit_all_warnings!

project 'CocoaHeadsApp.xcodeproj'

target 'CocoaHeadsApp' do
  use_frameworks!

  common_pods

  target 'CocoaHeadsAppIntegrationTests' do
    inherit! :search_paths
    common_test_pods
  end

  target 'CocoaHeadsAppTests' do
    inherit! :search_paths
    common_test_pods
  end

  target 'CocoaHeadsAppUITests' do
    inherit! :search_paths
    common_test_pods
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_TESTABILITY'] = 'YES'
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
        end
    end
end
