//
//  Endpoint.swift
//  TrustBank
//
//  Created by Trainee on 15/07/2026.
//

import Foundation

struct Endpoint {
    let url: URL
    let method: HTTPMethod
    let headers: [String: String]

    var request: URLRequest {
        var request = URLRequest(url: url)

        request.httpMethod = method.rawValue

        headers.forEach { key, value in
            request.setValue(
                value,
                forHTTPHeaderField: key
            )
        }

        return request
    }
}
