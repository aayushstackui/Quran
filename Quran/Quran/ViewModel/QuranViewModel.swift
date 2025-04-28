//
//  QuranViewModel.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/28/25.
//

import Foundation
import Combine

class QuranViewModel: ObservableObject {
    @Published var surahs: [Surah] = []
    @Published var currentVerse: Verse?
    @Published var currentChapter: Chapter?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let networkService = NetworkService()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchSurahs() {
        isLoading = true
        networkService.fetchSurahs()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] surahs in
                self?.surahs = surahs
            }
            .store(in: &cancellables)
    }
    
    func fetchVerse(surah: Int, ayah: Int) {
        isLoading = true
        networkService.fetchVerse(surah: surah, ayah: ayah)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] verse in
                self?.currentVerse = verse
            }
            .store(in: &cancellables)
    }
    
    func fetchChapter(surah: Int) {
        isLoading = true
        networkService.fetchChapter(surah: surah)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] chapter in
                self?.currentChapter = chapter
            }
            .store(in: &cancellables)
    }
}
