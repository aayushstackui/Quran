//
//  Surah.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/27/25.
//

import Foundation

struct Surah: Codable, Identifiable, Equatable {
    let id = UUID()
    let surahName: String
    let surahNameArabic: String
    let surahNameTranslation: String
    let revelationPlace: String
    let totalAyah: Int
    
    enum CodingKeys: String, CodingKey {
        case surahName, surahNameArabic, surahNameTranslation, revelationPlace, totalAyah
    }
}
