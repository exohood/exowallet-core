//
//  Error.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation

public enum CoinSwitchError: Error {
    case authenticationError(_ message: String)
    case invalidAddress(_ message: String)
    case invalidInput(_ message: String)
    case invalidSymbol(_ message: String)
    case tempInactiveCoin(_ message: String)
    case inactiveCoin(_ message: String)
    case tradePairDisabled(_ message: String)
    case limitExceeded(_ message: String)
    case unknown(_ message: String)
    case minLimitBreached(_ message: String)
    case maxLimitBreached(_ message: String)
    
    internal static func from(code: String, message: String) -> CoinSwitchError {
        switch code {
        case "authentication_error":
            return .authenticationError(message)
        case "invalid_address":
            return .invalidAddress(message)
        case "invalid_input":
            return .invalidInput(message)
        case "invalid_symbol":
            return .invalidSymbol(message)
        case "temp_inactive_coin":
            return .tempInactiveCoin(message)
        case "inactive_coin":
            return .inactiveCoin(message)
        case "trade_pair_disabled":
            return .tradePairDisabled(message)
        case "limit_exceeded":
            return .limitExceeded(message)
        case "min_limit_breached":
            return .minLimitBreached(message)
        case "max_limit_breached":
            return .maxLimitBreached(message)
        default:
            return .unknown(message)
        }
    }
}

extension CoinSwitchError: LocalizedError {
    public var localizedDescription: String {
        switch self {
        case .authenticationError(let message), .invalidAddress(let message), .invalidInput(let message), .invalidSymbol(let message), .tempInactiveCoin(let message), .inactiveCoin(let message), .tradePairDisabled(let message), .limitExceeded(let message), .unknown(let message), .minLimitBreached(let message), .maxLimitBreached(let message):
        return message
        }
    }
}
