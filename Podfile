# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks! 
target 'SwiftStructure' do
pod 'ObjectMapper', '~> 2.2'
pod 'SlideMenuControllerSwift'
pod 'Kingfisher', '~> 3.0'
pod 'SwiftMessages'
pod 'SDCAlertView', '~> 7.1'
pod 'UIScrollView-InfiniteScroll'
pod 'Alamofire', '~> 4.3'
pod 'DGElasticPullToRefresh'
pod 'EZLoadingActivity'

end
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
