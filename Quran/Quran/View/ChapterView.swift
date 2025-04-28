//
//  ChapterView.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/28/25.
//

import SwiftUI

struct ChapterView: View {
    @StateObject private var viewModel = QuranViewModel()
    let surahNo: Int
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let chapter = viewModel.currentChapter {
                    HeaderView(surahName: chapter.surahName)
                    ChapterListViw(chapter: chapter)
                }
            }
            .padding()
        }
        .background(Color.green.opacity(0.05))
        .onAppear {
            viewModel.fetchChapter(surah: surahNo)
        }
    }
}
