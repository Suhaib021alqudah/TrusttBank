//
//  Transaction.swift
//  TrustBank
//
//  Created by Trainee on 07/07/2026.
//

struct Transaction: Codable {
    let currency: String
    let name: String
    let amount: String
    let account: String
    let type: String
    let createdAt: String
    let description: String
    let id: String
}
