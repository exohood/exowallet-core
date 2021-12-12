//
//  Coin.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation

public struct Coin: Codable {
    public let name: String
    public let symbol: String
    public let isActive: Bool
    public let isFiat: Bool
    public let logoUrl: URL
}
