//
//  Account.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation

public struct Account: Codable {
    public let address: String
    public let tag: String?
    
    public init(address: String, tag: String?) {
        self.address = address
        self.tag = tag
    }
}
