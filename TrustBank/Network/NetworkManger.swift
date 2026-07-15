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

    func request<T: Decodable>(
        url: URL,
        responseType: T.Type,
        decoder: JSONDecoder = JSONDecoder()
    ) async throws
        -> T
    {

        do {

            let (data, response) = try await URLSession.shared.data(from: url)

            // MARK: - HTTP Response Errors

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            let apiError = try? decoder.decode(
                APIErrorResponse.self,
                from: data
            )

            switch httpResponse.statusCode {

            case 200...299:
                break

            case 400:
                throw NetworkError.badRequest

            case 401:
                throw NetworkError.unauthorized

            case 403:
                throw NetworkError.forbidden

            case 404:
                throw NetworkError.notFound

            case 422:
                if let message = apiError?.message {
                    throw NetworkError.serverMessage(message)
                }
                throw NetworkError.validationFailed

            case 500...599:
                throw NetworkError.serverError

            default:
                throw NetworkError.badStatusCode(
                    httpResponse.statusCode
                )
            }
            // MARK: - Decoding Errors
            do {
                return try JSONDecoder().decode(responseType, from: data)
            } catch {
                throw NetworkError.decodingFailed(error)
            }

        }  // MARK: - Cancellation Errors

        catch is CancellationError {
            throw NetworkError.cancelled

            // MARK: - Network Errors

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
