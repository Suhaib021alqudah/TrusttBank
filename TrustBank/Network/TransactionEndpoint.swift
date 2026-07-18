//
//  TransactionEndpoint.swift
//  TrustBank
//
//  Created by Trainee on 16/07/2026.
//


import Foundation

enum TransactionEndpoint {

    case getAll

    var endpoint: Endpoint {
        switch self {

        case .getAll:
            guard let url = URL(
                string:
                    "https://6a451378aab3faec3f695cbf.mockapi.io/transactions"
            ) else {
                fatalError("Invalid transactions URL")
            }

            return Endpoint(
                url: url,
                method: .get,
                headers: [
                    "Accept": "application/json"
                ]
            )
        }
    }
}