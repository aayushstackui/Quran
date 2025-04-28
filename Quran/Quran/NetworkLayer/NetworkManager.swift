//
//  NetworkManager.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/27/25.
//

import Foundation
import Combine

enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .networkError(let error): return "Network Error: \(error.localizedDescription)"
        case .decodingError(let error): return "Decoding Error: \(error.localizedDescription)"
        case .unknown: return "Unknown Error Occurred"
        }
    }
}

struct NetworkService {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchSurahs() -> AnyPublisher<[Surah], APIError> {
        guard let url = URL(string: "https://quranapi.pages.dev/api/surah.json") else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .mapError { APIError.networkError($0) }
            .flatMap { data, _ in
                Just(data)
                    .decode(type: [Surah].self, decoder: JSONDecoder())
                    .mapError { APIError.decodingError($0) }
            }
            .eraseToAnyPublisher()
    }
    
    func fetchVerse(surah: Int, ayah: Int) -> AnyPublisher<Verse, APIError> {
        guard let url = URL(string: "https://quranapi.pages.dev/api/\(surah)/\(ayah).json") else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .mapError { APIError.networkError($0) }
            .flatMap { data, _ in
                Just(data)
                    .decode(type: Verse.self, decoder: JSONDecoder())
                    .mapError { APIError.decodingError($0) }
            }
            .eraseToAnyPublisher()
    }
    
    func fetchChapter(surah: Int) -> AnyPublisher<Chapter, APIError> {
        guard let url = URL(string: "https://quranapi.pages.dev/api/\(surah).json") else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .mapError { APIError.networkError($0) }
            .flatMap { data, _ in
                Just(data)
                    .decode(type: Chapter.self, decoder: JSONDecoder())
                    .mapError { APIError.decodingError($0) }
            }
            .eraseToAnyPublisher()
    }
}
