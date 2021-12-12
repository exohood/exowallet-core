//
//  CoinSwitchRequest.swift
//  CoinSwitchAPI
//
//  Created by Dominique Stranz on 14/05/2019.
//

import Foundation
#if canImport(CoinpaprikaNetworking)
import CoinpaprikaNetworking
#else
import Coinpaprika
#endif

public struct CoinSwitchRequest<Model: Codable> {
    let request: Request<Envelope<Model>>
    
    init(baseUrl: URL, method: Request<Envelope<Model>>.Method, path: String, params: [String: Any], credentials: Credentials) {
        request = Request<Envelope<Model>>(baseUrl: baseUrl, method: method, path: path, params: params, userAgent: "CoinSwitch API Client - Swift", authorisation:  .custom(headers: credentials.asHeaders()))
    }
    
    public func perform(responseQueue: DispatchQueue? = nil, cachePolicy: URLRequest.CachePolicy? = nil, _ callback: @escaping (Result<Model, Error>) -> Void) {
        request.perform(responseQueue: responseQueue, cachePolicy: cachePolicy) { (response) in
            switch response {
            case .success(let envelope):
                if let result = envelope.data {
                    callback(Result.success(result))
                } else if let message = envelope.msg {
                    callback(Result.failure(CoinSwitchError.from(code: envelope.code, message: message)))
                } else {
                    callback(Result.failure(ResponseError.unableToDecodeResponse(url: nil)))
                }
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }
}
