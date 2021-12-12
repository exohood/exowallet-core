# ChangellyAPI

[![Version](https://img.shields.io/cocoapods/v/ChangellyAPI.svg?style=flat)](https://cocoapods.org/pods/ChangellyAPI)
[![License](https://img.shields.io/cocoapods/l/ChangellyAPI.svg?style=flat)](https://cocoapods.org/pods/ChangellyAPI)
[![Platform](https://img.shields.io/cocoapods/p/ChangellyAPI.svg?style=flat)](https://cocoapods.org/pods/ChangellyAPI)
![Swift 5.0](https://img.shields.io/badge/swift-4.2%20%7C%205.0-orange.svg)

* Supports all endpoints from API
* Returns response objects transparently decoded via Codable
* Based on Swift 5 Result enum
* Handle Changelly requests signing

## Example

```swift
import Changelly

let client = Changelly.API(key: "{YOUR_API_KEY}", secret: "{YOUR_API_SECRET}")
client.getCurrencies().perform  { result in
    do {
      let currencies = try? result.get()
      // use successfull response
    } catch {
      // handle request error
    }
}
```

## Installation

ChangellyAPI is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ChangellyAPI'
```

## License

ChangellyAPI is available under the MIT license. See the LICENSE file for more info.
