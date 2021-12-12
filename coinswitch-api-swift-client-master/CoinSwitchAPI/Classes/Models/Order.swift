//
//  Order.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation

public struct Order: Codable {
    public let orderId: String
    public let exchangeAddress: Account
    public let destinationAddress: Account
    public let createdAt: Date
    public let status: Status
    public let inputTransactionHash: String?
    public let outputTransactionHash: String?
    public let depositCoin: String
    public let destinationCoin: String
    public let depositCoinAmount: Decimal?
    public let destinationCoinAmount: Decimal?
    public let validTill: String
    public let userReferenceId: String
    
    public enum Status: String, Codable {
        case noDeposit = "no_deposit"
        case confirming
        case exchanging
        case sending
        case complete
        case failed
        case refunded
        case timeout
        
        var localizedDescription: String {
            switch self {
            case .noDeposit:
                return "No deposit has been detected on the transaction."
            case .confirming:
                return "Your transaction is waiting to be confirmed on blockchain."
            case .exchanging:
                return "Your payment is received and being exchanged via our partner."
            case .sending:
                return "Destination Coin is sending to the destination address."
            case .complete:
                return "Destination Coin is successfully sent to the destination address."
            case .failed:
                return "Transaction has failed. Feel free to reach out to api-support@coinswitch.co."
            case .refunded:
                return "Exchange was failed and coins were refunded to user's wallet."
            case .timeout:
                return "No deposit was detected for the order with in validity period."
            }
        }
    }
}
