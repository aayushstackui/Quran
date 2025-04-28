//
//  SurahListView.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/28/25.
//

import SwiftUI

struct SurahListView: View {
    @ObservedObject var viewModel: QuranViewModel
    
    var body: some View {
        List(viewModel.surahs) { surah in
            NavigationLink {
                ChapterView(surahNo: viewModel.surahs.firstIndex(of: surah)! + 1)
            } label: {
                VStack(alignment: .leading, spacing: 8) {
                    Text(surah.surahNameArabic)
                        .font(.custom("Scheherazade", size: 24))
                        .foregroundColor(.black)
                    
                    Text(surah.surahNameTranslation)
                        .font(.custom("Avenir", size: 16))
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .listRowBackground(Color.white)
        }
        .listStyle(PlainListStyle())
        .background(Color.green.opacity(0.05))
        .onAppear {
            viewModel.fetchSurahs()
        }
    }
}

struct SurahListView_Previews: PreviewProvider {
    static var previews: some View {
        SurahListView(viewModel: QuranViewModel())
    }
}
