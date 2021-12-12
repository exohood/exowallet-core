#
# Be sure to run `pod lib lint ChangellyAPI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ChangellyAPI'
  s.module_name      = 'Changelly'
  s.version          = '1.1.1'
  s.summary          = 'Changelly - crypto to crypto exchange service - API client'

  s.description      = <<-DESC
* Supports all endpoints from API
* Returns response objects transparently decoded via Codable
* Based on Swift 5 Result enum
* Handle Changelly requests signing
                       DESC

  s.homepage         = 'https://github.com/coinpaprika/changelly-api-swift-client'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dominique Stranz' => 'dstranz@greywizard.com' }
  s.source           = { :git => 'https://github.com/coinpaprika/changelly-api-swift-client.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/coinpaprika'

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.watchos.deployment_target = '3.0'
  s.tvos.deployment_target = '10.0'
  
  s.swift_versions = ['4.2', '5.0']
  s.cocoapods_version = '> 1.6.1'

  s.source_files = 'ChangellyAPI/Classes/**/*'

  s.dependency 'CoinpaprikaAPI/Networking'
end
