//
//  NewOrder.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation

public struct NewOrder: Codable {
    public let orderId: String
    public let exchangeAddress: Account
    public let expectedDepositCoinAmount: Decimal
    public let expectedDestinationCoinAmount: Decimal
}
