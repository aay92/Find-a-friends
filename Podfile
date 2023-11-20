# variables
IOS_PLATFORM = '13.0'

# Uncomment the next line to define a global platform for your project
platform :ios, IOS_PLATFORM

target 'Find a friend' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Find a friend
pod 'FirebaseAuth'
pod 'Firebase/Storage'
pod 'FirebaseDatabase'
pod 'FirebaseFirestore'
pod 'FirebaseStorage'
pod 'MessageKit' 

end

# post install
post_install do |installer|
  # ios deployment version
  installer.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = IOS_PLATFORM
    end
  end

  # fix for xcode14 codesign for dependencies - remove after fix oficially
  installer.pods_project.targets.each do |target|
    if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
      target.build_configurations.each do |config|
          config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      end
    end
  end
end
