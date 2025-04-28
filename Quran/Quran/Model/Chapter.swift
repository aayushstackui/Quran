//
//  Chapter.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/27/25.
//

import Foundation

struct Chapter: Codable {
    let surahName: String
    let surahNo: Int
    let totalAyah: Int
    let english: [String]
    let arabic1: [String]
    let audio: [String: Audio]
}  
