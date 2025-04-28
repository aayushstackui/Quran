//
//  IdentifiableError.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/28/25.
//

import Foundation

struct IdentifiableError: Identifiable {
    let id = UUID()
    let message: String
}
