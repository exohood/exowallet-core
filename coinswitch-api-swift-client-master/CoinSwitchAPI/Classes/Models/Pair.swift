//
//  Pair.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation

public struct Pair: Codable {
    public let depositCoin: String
    public let destinationCoin: String
    public let isActive: Bool
}
