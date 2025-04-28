//
//  QuranHomeView.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/28/25.
//

import SwiftUI
import Foundation

struct QuranHomeView: View {
    @StateObject private var viewModel = QuranViewModel()
    @State private var selectedSurah: Int = 1
    @State private var selectedAyah: Int = 1
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                VStack {
                    HStack{
                        Image(systemName: "moon.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.purple)
                            .shadow(radius: 2)
                        
                        Text("Qur'an")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.purple, .green],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .shadow(color: .gray.opacity(0.3), radius: 2, x: 0, y: 2)
                    }
                    Text("By Ayush Raghuvanshi")
                        .font(.subheadline)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.gray],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                }
            }
            TabView {
                SurahListView(viewModel: viewModel)
                    .tabItem {
                        Label("Surahs", systemImage: "book")
                    }
                
                VerseView(
                    viewModel: viewModel,
                    selectedSurah: $selectedSurah,
                    selectedAyah: $selectedAyah
                )
                .tabItem {
                    Label("Verse", systemImage: "text.book.closed")
                }
            }
            .overlay(LoadingOverlay(isLoading: viewModel.isLoading))
            .accentColor(Color.green.opacity(0.70))
            .alert(item: Binding(
                get: { viewModel.errorMessage.map { IdentifiableError(message: $0) } },
                set: { _ in viewModel.errorMessage = nil }
            )) { error in
                Alert(title: Text("Error"), message: Text(error.message))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    struct QuranHomeView_Previews: PreviewProvider {
        static var previews: some View {
            QuranHomeView()
        }
    }
}
