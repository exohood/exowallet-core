# CoinSwitchAPI

[![Version](https://img.shields.io/cocoapods/v/CoinSwitchAPI.svg?style=flat)](https://cocoapods.org/pods/CoinSwitchAPI)
[![License](https://img.shields.io/cocoapods/l/CoinSwitchAPI.svg?style=flat)](https://cocoapods.org/pods/CoinSwitchAPI)
[![Platform](https://img.shields.io/cocoapods/p/CoinSwitchAPI.svg?style=flat)](https://cocoapods.org/pods/CoinSwitchAPI)
![Swift 5.0](https://img.shields.io/badge/swift-4.2%20%7C%205.0-orange.svg)

* Supports all endpoints from Dynamic API
* Returns response objects transparently decoded via Codable
* Based on Swift 5 Result enum

## Example

```swift
import CoinSwitch

let client = CoinSwitch.API(key: "{YOUR_API_KEY}", ip: "{YOUR_API_SECRET}")
client.getCoins().perform  { result in
do {
let coins = try? result.get()
// use successfull response
} catch {
// handle request error
}
}
```

## Installation

CoinSwitchAPI is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CoinSwitchAPI'
```

## License

CoinSwitchAPI is available under the MIT license. See the LICENSE file for more info.
