# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'EasyCart' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'CarbonKit'
  # Pods for Easycart
  post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      end
    end
  end
  # Pods for EasyCart
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'GoogleSignIn'
end
