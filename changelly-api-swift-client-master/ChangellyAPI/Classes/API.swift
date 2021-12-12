//
//  ChangellyAPI.swift
//  ChangellyAPI
//
//  Created by Dominique Stranz on 10/04/2019.
//

import Foundation

public typealias ChangellyAPI = API

public struct API {
    private let credentials: Credentials
    private let baseUrl: URL = URL(string: "https://api.changelly.com")!
    
    public init(key: String, secret: String) {
        self.credentials = Credentials(key: key, secret: secret)
    }
    
    public func getCurrencies() -> JsonRpcRequest<[String]> {
        return JsonRpcRequest<[String]>(baseUrl: baseUrl, method: "getCurrencies", params: [:], credentials: credentials)
    }
    
    public func getCurrenciesFull() -> JsonRpcRequest<[Currency]> {
        return JsonRpcRequest<[Currency]>(baseUrl: baseUrl, method: "getCurrenciesFull", params: [:], credentials: credentials)
    }
    
    public func getMinAmount(from: String, to: String) -> JsonRpcRequest<String> {
        return JsonRpcRequest<String>(baseUrl: baseUrl, method: "getMinAmount", params: ["from": from, "to": to], credentials: credentials)
    }
    
    public func getExchangeAmount(from: String, to: String, amount: Decimal) -> JsonRpcRequest<String> {
        return JsonRpcRequest<String>(baseUrl: baseUrl, method: "getExchangeAmount", params: ["from": from, "to": to, "amount": amount], credentials: credentials)
    }
    
    public func createTransaction(from: String, to: String, amount: Decimal, address: String, extraId: String? = nil, refundAddress: String? = nil, refundExtraId: String? = nil) -> JsonRpcRequest<Transaction> {
        var params: [String : Any] = ["from": from, "to": to, "amount": amount, "address": address]
        params["extraId"] = extraId
        params["refundAddress"] = refundAddress
        params["refundExtraId"] = refundExtraId
        return JsonRpcRequest<Transaction>(baseUrl: baseUrl, method: "createTransaction", params: params, credentials: credentials)
    }
    
    public func getTransactions(currency: String? = nil, address: String? = nil, extraId: String? = nil, limit: Int? = nil, offset: Int? = nil) -> JsonRpcRequest<[TransactionLog]> {
        var params = [String : Any]()
        params["currency"] = currency
        params["address"] = address
        params["extraId"] = extraId
        params["limit"] = limit
        params["offset"] = offset
        return JsonRpcRequest<[TransactionLog]>(baseUrl: baseUrl, method: "getTransactions", params: params, credentials: credentials)
    }
    
    public func getStatus(id: String) -> JsonRpcRequest<Transaction.Status> {
        return JsonRpcRequest<Transaction.Status>(baseUrl: baseUrl, method: "getStatus", params: ["id": id], credentials: credentials)
    }
    
    
    
}
