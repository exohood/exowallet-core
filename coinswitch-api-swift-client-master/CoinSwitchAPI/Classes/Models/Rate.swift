//
//  Rate.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation

public struct Rate: Codable {
    public let rate: Decimal
    public let minerFee: Decimal
    public let limitMinDepositCoin: Decimal
    public let limitMaxDepositCoin: Decimal
    public let limitMinDestinationCoin: Decimal
    public let limitMaxDestinationCoin: Decimal
}

public struct CoinRate: Codable {
    public let depositCoin: String
    public let destinationCoin: String
    public let rate: Decimal
    public let minerFee: Decimal
    public let limitMinDepositCoin: Decimal
    public let limitMaxDepositCoin: Decimal
    public let limitMinDestinationCoin: Decimal
    public let limitMaxDestinationCoin: Decimal
}
