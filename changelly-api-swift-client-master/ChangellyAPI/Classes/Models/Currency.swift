//
//  Currency.swift
//  ChangellyAPI
//
//  Created by Dominique Stranz on 10/04/2019.
//

import Foundation

public struct Currency: Codable {
    public let name: String
    public let fullName: String
    public let enabled: Bool
    public let fixRateEnabled: Bool
    public let payinConfirmations: Int
    public let extraIdName: String?
    public let addressUrl: String?
    public let transactionUrl: String?
    public let image: URL
    public let fixedTime: Int
}
