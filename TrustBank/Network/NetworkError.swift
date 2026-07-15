//
//  NetworkError.swift
//  TrustBank
//
//  Created by Trainee on 15/07/2026.
//


enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case badStatusCode(Int)
    case decodingFailed(Error)
    case noInternet
    case timeout
    case cancelled
    case unknown(Error)
}