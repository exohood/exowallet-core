//
//  Credentials.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation

public struct Credentials {
    /// API Key
    public let key: String
    
    /// Client IP
    public let ip: String?

    internal func asHeaders() -> [String: String] {
        var headers = [String: String]()
        headers["x-api-key"] = key
        headers["x-user-ip"] = ip
        return headers
    }
}
