//
//  Transaction.swift
//  ChangellyAPI
//
//  Created by Dominique Stranz on 10/04/2019.
//

import Foundation

public struct Transaction: Codable {
    public let id: String
    public let apiExtraFee: String
    public let changellyFee: String
    public let payinExtraId: String?
    public let payoutExtraId: String?
    public let amountExpectedFrom: Decimal
    public let amountExpectedTo: String
    public let status: Status
    public let currencyFrom: String
    public let currencyTo: String
    public let payinAddress: String
    public let payoutAddress: String
    public let refundAddress: String?
    public let refundExtraId: String?
    public let createdAt: Date
    public let kycRequired: Bool
    
    public enum Status: String, Codable {
        case new
        case waiting
        case confirming
        case exchanging
        case sending
        case finished
        case failed
        case refunded
        case overdue
        case hold
        
        var localizedDescription: String {
            switch self {
            case .new:
                return "Freshly created transaction."
            case .waiting:
                return "Transaction is waiting for an incoming payment."
            case .confirming:
                return "We have received payin and are waiting for certain amount of confirmations depending of incoming currency."
            case .exchanging:
                return "Payment was confirmed and is being exchanged."
            case .sending:
                return "Coins are being sent to the recipient address."
            case .finished:
                return "Coins were successfully sent to the recipient address."
            case .failed:
                return "Transaction has failed. In most cases, the amount was less than the minimum. Please contact support and provide a transaction id."
            case .refunded:
                return "Exchange failed and coins were refunded to user's wallet. The wallet address should be provided by user."
            case .overdue:
                return "We did not receive any payment since 36 hours from transaction creation."
            case .hold:
                return "Due to AML/KYC procedure, exchange may be delayed"
            }
        }
    }
}
