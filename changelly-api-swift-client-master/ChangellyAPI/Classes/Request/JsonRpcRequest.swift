//
//  Request+JSON-RPC.swift
//  Coinpaprika
//
//  Created by Dominique Stranz on 06.09.2018.
//  Copyright © 2018 Grey Wizard sp. z o.o. All rights reserved.
//

import Foundation
#if canImport(CoinpaprikaNetworking)
import CoinpaprikaNetworking
#else
import Coinpaprika
#endif

public struct JsonRpcRequest<Model: Codable> {
    
    let request: Request<JsonRpcResponseEvelope<Model>>
    
    init(baseUrl: URL, method: String, params: [String: Any], credentials: Credentials) {
        let requestId = JsonRpcIdentifier.next()
        let rpcBody = ["jsonrpc": "2.0", "method": method, "id": requestId, "params": params] as [String: Any]
        request = Request<JsonRpcResponseEvelope<Model>>(baseUrl: baseUrl, method: .post, path: "", params: rpcBody, userAgent: "Changelly API Client - Swift", authorisation: .dynamic(signer: { (request) in
            guard let jsonData = request.httpBody, let signature = credentials.signature(for: jsonData) else {
                return
            }
            
            request.addValue(credentials.key, forHTTPHeaderField: "api-key")
            request.addValue(signature, forHTTPHeaderField: "sign")
        }))
    }
    
    public func perform(responseQueue: DispatchQueue? = nil, cachePolicy: URLRequest.CachePolicy? = nil, _ callback: @escaping (Result<Model, Error>) -> Void) {
        request.perform(responseQueue: responseQueue, cachePolicy: cachePolicy) { (response) in
            switch response {
            case .success(let envelope):
                if let result = envelope.result {
                    callback(Result.success(result))
                } else if let error = envelope.error {
                    callback(Result.failure(JsonRpcError.serviceError(code: error.code, message: error.message)))
                } else {
                    callback(Result.failure(JsonRpcError.unableToDecodeEnvelope))
                }
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }
}

struct JsonRpcIdentifier {
    private static var currentId: Int = 1
    
    static func next() -> Int {
        defer { currentId += 1 }
        return currentId
    }
}

enum JsonRpcError: Error {
    case unableToDecodeEnvelope
    case serviceError(code: Int, message: String)
}

extension JsonRpcError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unableToDecodeEnvelope:
            return "Unable to decode response"
        case .serviceError(_, let message):
            return "\(message)"
        }
    }
}

public struct JsonRpcResponseEvelope<Model: Codable>: CodableModel {
    let id: Int
    let result: Model?
    let error: JsonRpcErrorEnvelope?

    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formatter
    }
    
    public static var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy? {
        return .custom({ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            if let raw = try? container.decode(String.self) {
                return dateFormatter.date(from: raw)!
            } else {
                let raw = try! container.decode(Int.self)
                return Date(timeIntervalSince1970: TimeInterval(raw))
            }
        })
    }
}

struct JsonRpcErrorEnvelope: Codable {
    let code: Int
    let message: String
}
