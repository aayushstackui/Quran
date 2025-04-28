//
//  HeaderView.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/28/25.
//

import SwiftUI

struct HeaderView: View {
    let surahName: String
    
    var body: some View {
        Text(surahName)
            .font(.custom("Al Qalam Quran", size: 32))
            .foregroundColor(.green)
            .padding(.bottom, 10)
    }
}

