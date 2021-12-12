//
//  NewOrderParams.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation

/// New exchange transaction order
public struct NewOrderParams: Codable {
    public let depositCoin: String
    public let destinationCoin: String
    public let depositCoinAmount: Decimal?
    public let destinationCoinAmount: Decimal?
    public let destinationAddress: Account
    public let refundAddress: Account?
    
    /// Create exchange transaction with fixed deposit coin amount
    /// - Parameter depositCoin: deposit coin id
    /// - Parameter destinationCoin: destination coin id
    /// - Parameter depositCoinAmount: deposit - declared coin amount
    /// - Parameter destinationAddress: destination address
    /// - Parameter refundAddress: refund address (optional, required for UTXO based coins)
    public init(depositCoin: String, destinationCoin: String, depositCoinAmount: Decimal, destinationAddress: Account, refundAddress: Account? = nil) {
        self.depositCoin = depositCoin
        self.destinationCoin = destinationCoin
        self.depositCoinAmount = depositCoinAmount
        self.destinationCoinAmount = nil
        self.destinationAddress = destinationAddress
        self.refundAddress = refundAddress
    }
    
    /// Create exchange transaction with desired destination coin amount
    /// - Parameter depositCoin: deposit coin id
    /// - Parameter destinationCoin: destination coin id
    /// - Parameter destinationCoinAmount: destination - desired coin amount
    /// - Parameter destinationAddress: destination address
    /// - Parameter refundAddress: refund address (optional, required for UTXO based coins)
    public init(depositCoin: String, destinationCoin: String, destinationCoinAmount: Decimal, destinationAddress: Account, refundAddress: Account? = nil) {
        self.depositCoin = depositCoin
        self.destinationCoin = destinationCoin
        self.depositCoinAmount = nil
        self.destinationCoinAmount = destinationCoinAmount
        self.destinationAddress = destinationAddress
        self.refundAddress = refundAddress
    }
    
    var asDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any]
    }
}
