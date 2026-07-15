//
//  NetworkManger.swift
//  TrustBank
//
//  Created by Trainee on 07/07/2026.
//

import Foundation

final class NetworkManager {

    static let shared = NetworkManager()
    private init() {}

    func request<T: Decodable>(url: URL, responseType: T.Type) async throws
        -> T
    {

        do {

            let (data, response) = try await URLSession.shared.data(from: url)

            // MARK: - HTTP Response Errors
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            guard 200...299 ~= httpResponse.statusCode else {
                throw NetworkError.badStatusCode(httpResponse.statusCode)
            }
            do {
                return try JSONDecoder().decode(responseType, from: data)
            } catch {
                throw NetworkError.decodingFailed(error)
            }

        }
        // MARK: - Network Errors
        
    
        catch is CancellationError {
            throw NetworkError.cancelled
        } catch let urlError as URLError {

            switch urlError.code {

            case .notConnectedToInternet:
                throw NetworkError.noInternet

            case .timedOut:
                throw NetworkError.timeout

            case .cancelled:
                throw NetworkError.cancelled

            default:
                throw NetworkError.unknown(urlError)
            }

        } catch let networkError as NetworkError {
            throw networkError
        } catch {
            throw NetworkError.unknown(error)
        }
    }

}
