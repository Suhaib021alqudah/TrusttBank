//
//  NetworkManagerProtocol.swift
//  TrustBank
//
//  Created by Trainee on 16/07/2026.
//




import Foundation

protocol NetworkManagerProtocol {

    func request<T: Decodable >(
        request: URLRequest,
        responseType: T.Type,
        decoder: JSONDecoder
    ) async throws -> T
}
