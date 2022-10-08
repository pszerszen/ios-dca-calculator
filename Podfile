# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'


target 'ios-dca-calculator' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  

  pod 'MBProgressHUD', '1.2.0', :inhibit_warnings => true
  pod 'Loaf', '0.5.0', :inhibit_warnings => true

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
    end
  end
end
