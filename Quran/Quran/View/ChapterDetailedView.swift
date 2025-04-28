//
//  ChapterDetailedView.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/28/25.
//

import SwiftUI

struct ChapterDetailedView: View {
    let arabicText: String
    let englishText: String
    let verseNumber: Int
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 12) {
            Text("﴾\(verseNumber)﴿ \(arabicText)")
                .font(.custom("Scheherazade", size: 24))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            Text("\(verseNumber). \(englishText)")
                .font(.custom("Avenir", size: 16))
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.green.opacity(0.3), lineWidth: 2)
        )
    }
}
