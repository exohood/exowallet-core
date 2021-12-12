#
# Be sure to run `pod lib lint CoinSwitchAPI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'CoinSwitchAPI'
    s.module_name      = 'CoinSwitch'
    s.version          = '1.1.4'
    s.summary          = 'CoinSwitch - crypto to crypto exchange service - API client'

    s.description      = <<-DESC
    * Supports all endpoints from Dynamic API
    * Returns response objects transparently decoded via Codable
    * Based on Swift 5 Result enum
    DESC

    s.homepage         = 'https://github.com/coinpaprika/coinswitch-api-swift-client'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Dominique Stranz' => 'dstranz@greywizard.com' }
    s.source           = { :git => 'https://github.com/coinpaprika/coinswitch-api-swift-client.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/coinpaprika'

    s.ios.deployment_target = '10.0'
    s.osx.deployment_target = '10.12'
    s.watchos.deployment_target = '3.0'
    s.tvos.deployment_target = '10.0'

    s.swift_versions = ['4.2', '5.0']
    s.cocoapods_version = '> 1.6.1'

    s.source_files = 'CoinSwitchAPI/Classes/**/*'

    s.dependency 'CoinpaprikaAPI/Networking'
end
