# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

inhibit_all_warnings!
def shared_pods
    use_frameworks!
    pod 'Alamofire', '~> 4.3'
    pod 'IQKeyboardManagerSwift', '~> 4.0'
    pod 'KVNProgress', :git => 'https://github.com/kevin-hirsch/KVNProgress.git', :tag => '2.2'
    pod 'Moya', '~> 8.0'
    pod 'ObjectMapper', '~> 2.2'
    pod 'AlamofireObjectMapper', '~> 4.0'
    pod 'DATAStack', '~> 7.0'
    pod 'PromiseKit', '~> 4.1'
    pod 'FXKeychain', '~> 1.5'
    pod 'Kingfisher', '~> 3.0'
    pod 'DateToolsSwift', '~> 2.0'
end

target 'education' do

  shared_pods

end

def prepareToSwift3(installer)
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end

post_install do |installer|
    prepareToSwift3 installer
end
