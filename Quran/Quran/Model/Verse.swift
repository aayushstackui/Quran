//
//  Verse.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/27/25.
//

import Foundation

struct Verse: Codable, Identifiable {
    let id = UUID()
    let surahName: String
    let surahNo: Int
    let ayahNo: Int
    let english: String
    let arabic1: String
    let audio: [String: Audio]
}

struct Audio: Codable {
    let reciter: String
    let url: String
}
