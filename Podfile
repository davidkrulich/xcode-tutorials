# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

def shared_pods
    
    pod 'Alamofire'
    pod 'AlamofireObjectMapper'
    
end

target 'HelloWorld' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  shared_pods
  # Pods for HelloWorld
#  pod 'EarlGreyApp'
end

target 'HelloWorldTests' do
  inherit! :search_paths
  
  shared_pods
  # Pods for testing
end

target 'HelloWorldUITests' do
  shared_pods
  
  # Pods for testing
#  pod 'EarlGreyTest'
end
