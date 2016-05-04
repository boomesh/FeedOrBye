# Uncomment this line to define a global platform for your project
platform :ios, '9.0'

# Uncomment this line if you're using Swift
use_frameworks!

def common_pods
	pod 'FOBKit', :path => 'FOBKit/'
end

def ios_app_pods
	common_pods
    pod 'Alamofire'
end

def ios_widget_pods
	common_pods
end

target 'Feed or Bye' do
	ios_app_pods
end

target 'Feed or Bye Tests' do

end

target 'Feed or Bye UITests' do

end

target 'Feed Or Bye Widget' do
	ios_widget_pods
end

