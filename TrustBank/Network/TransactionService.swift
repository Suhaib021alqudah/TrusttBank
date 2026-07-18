//
//  TransactionService.swift
//  TrustBank
//
//  Created by Trainee on 16/07/2026.
//

import Foundation

final class TransactionService {

    private let networkManager: NetworkManagerProtocol
    init(
        networkManager: NetworkManagerProtocol = NetworkManager.shared
    ) {
        self.networkManager = networkManager
    }

    func fetchTransactions() async throws -> [Transaction] {
        let endpoint = TransactionEndpoint.getAll.endpoint

        return try await networkManager.request(
            request: endpoint.request,
            responseType: [Transaction].self,
            decoder: JSONDecoder()
        )
    }
}
