//
//  NetworkError.swift
//  TrustBank
//
//  Created by Trainee on 15/07/2026.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse

    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case validationFailed
    case serverError
    case badStatusCode(Int)

    case decodingFailed(Error)
    case noInternet
    case timeout
    case cancelled
    case unknown(Error)
    case serverMessage(String)

    var errorDescription: String? {
        switch self {

        case .invalidURL:
            return "The URL is invalid."

        case .invalidResponse:
            return "Invalid server response."

        case .badRequest:
            return "The request is invalid."

        case .unauthorized:
            return "Your session has expired. Please log in again."

        case .forbidden:
            return "You do not have permission to perform this action."

        case .notFound:
            return "The requested resource was not found."

        case .validationFailed:
            return "Some of the provided information is invalid."

        case .serverError:
            return
                "The server is currently unavailable. Please try again later."

        case .badStatusCode(let code):
            return "Server returned status code \(code)."

        case .decodingFailed:
            return "Failed to process the server response."

        case .noInternet:
            return "No internet connection."

        case .timeout:
            return "The request timed out."

        case .cancelled:
            return "The request was cancelled."

        case .unknown:
            return "An unknown error occurred."

        case .serverMessage(let message):
            return message
        }
    }
}
