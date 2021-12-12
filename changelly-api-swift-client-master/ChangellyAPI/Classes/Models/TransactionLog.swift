//
//  TransactionLog.swift
//  ChangellyAPI
//
//  Created by Dominique Stranz on 10/04/2019.
//

import Foundation

public struct TransactionLog: Codable {
    public let id: String
    public let createdAt: Date
    public let moneyReceived: Decimal
    public let moneySent: Decimal
    public let payinConfirmations: String
    public let status: Transaction.Status
    public let currencyFrom: String
    public let currencyTo: String
    public let payinAddress: String
    public let payinExtraId: String?
    public let payinHash: String?
    public let amountExpectedFrom: String
    public let payoutAddress: String
    public let payoutExtraId: String?
    public let payoutHash: String?
    public let refundHash: String?
    public let amountFrom: String
    public let amountTo: String
    public let networkFee: String?
    public let changellyFee: String
    public let apiExtraFee: String
}
