//
//  ChapterListViw.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/28/25.
//

import SwiftUI

struct ChapterListViw: View {
    let chapter: Chapter
    
    var body: some View {
        ForEach(0..<chapter.arabic1.count, id: \.self) { index in
            ChapterDetailedView(
                arabicText: chapter.arabic1[index],
                englishText: chapter.english[index],
                verseNumber: index + 1
            )
        }
    }
}

