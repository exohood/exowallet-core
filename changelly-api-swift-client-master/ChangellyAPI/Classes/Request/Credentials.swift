//
//  Credentials.swift
//  ChangellyAPI
//
//  Created by Dominique Stranz on 10/04/2019.
//

import Foundation

public struct Credentials {
    public let key: String
    public let secret: String
    
    internal func signature(for data: Data) -> String? {
        guard let jsonString = String(data: data, encoding: .utf8) else {
            return nil
        }
        
        return jsonString.hmac(key: secret)
    }
}
