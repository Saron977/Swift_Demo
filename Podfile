# Uncomment the next line to define a global platform for your project
 platform :ios, '10.0'

target 'Swift_Demo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Swift_Demo
  # 网络
#  pod 'Moya', '13.0.0'
  pod 'Moya/RxSwift', '~> 13.0'
#  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'
  # 线程
  pod 'PromiseKit', '~> 6.8'
  # 动画
#  pod 'NumberMorphView', '0.2.0'
#  pod 'PeekPop', '~> 1.0'
  pod 'RAMAnimatedTabBarController'
#  pod 'DGElasticPullToRefresh'
  # 点赞动画
#  pod 'DOFavoriteButton'
  # 约束
  pod 'SnapKit', '~> 5.0.0'
  # json解析
  pod 'HandyJSON', '~> 5.0.0'
  
  target 'Swift_DemoTests' do
    inherit! :search_paths
    # Pods for testing

  end

  target 'Swift_DemoUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  # Cocoapods optimization, always clean project after pod updating
  Dir.glob(installer.sandbox.target_support_files_root + "Pods-*/*.sh").each do |script|
    flag_name = File.basename(script, ".sh") + "-Installation-Flag"
    folder = "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
    file = File.join(folder, flag_name)
    content = File.read(script)
    content.gsub!(/set -e/, "set -e\nKG_FILE=\"#{file}\"\nif [ -f \"$KG_FILE\" ]; then exit 0; fi\nmkdir -p \"#{folder}\"\ntouch \"$KG_FILE\"")
    File.write(script, content)
  end
  
  # Enable tracing resources
  installer.pods_project.targets.each do |target|
    if target.name == 'RxSwift'
      target.build_configurations.each do |config|
        if config.name == 'Debug'
          config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
        end
      end
    end
  end
end
