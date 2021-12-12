//
//  ItemsList.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation

public struct ItemsList<Item: Codable>: Codable {
    public let count: Int
    public let totalCount: Int
    public let items: [Item]
    public let isPrev: Bool
    public let isNext: Bool
}
