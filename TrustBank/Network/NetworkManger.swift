//
//  NetworkManger.swift
//  TrustBank
//
//  Created by Trainee on 07/07/2026.
//

import UIKit

class NetworkManager {

    static let shared = NetworkManager()

    init() {}

    func fetchTransactions(
        completion: @escaping (Result<[Transaction], Error>) -> Void
    ) {

        let urlString =
            "https://6a451378aab3faec3f695cbf.mockapi.io/transactions"

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                let noDataError = NSError(
                    domain: "",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "No data received"]
                )
                completion(.failure(noDataError))
                return
            }

            do {
                let decodedTransactions = try JSONDecoder().decode(
                    [Transaction].self,
                    from: data
                )
                completion(.success(decodedTransactions))
            } catch {
                completion(.failure(error))
            }

        }.resume()
    }
}
