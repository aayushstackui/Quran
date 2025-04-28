//
//  VerseView.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/28/25.
//

import SwiftUI

struct VerseView: View {
    @ObservedObject var viewModel: QuranViewModel
    @Binding var selectedSurah: Int
    @Binding var selectedAyah: Int
    
    var body: some View {
        VStack {
            Picker("Surah", selection: $selectedSurah) {
                ForEach(1...114, id: \.self) { i in
                    Text("Surah \(i)").tag(i)
                }
            }
            
            Picker("Ayah", selection: $selectedAyah) {
                ForEach(1...7, id: \.self) { i in
                    Text("Ayah \(i)").tag(i)
                }
            }
            
            VerseContentView(verse: viewModel.currentVerse)
        }
        .onChange(of: selectedSurah) { _ in
            viewModel.fetchVerse(surah: selectedSurah, ayah: selectedAyah)
        }
        .onChange(of: selectedAyah) { _ in
            viewModel.fetchVerse(surah: selectedSurah, ayah: selectedAyah)
        }
    }
}

struct VerseView_Previews: PreviewProvider {
    static var previews: some View {
        VerseView(
            viewModel: QuranViewModel(),
            selectedSurah: .constant(1),
            selectedAyah: .constant(1)
        )
    }
}
