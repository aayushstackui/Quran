//
//  VerseContentView.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/28/25.
//

import SwiftUI
import AVKit

struct VerseContentView: View {
    let verse: Verse?
    @State private var player: AVPlayer?
    @State private var isPressed = false
    
    init(verse: Verse?) {
        self.verse = verse
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
    }
    
    var body: some View {
        if let verse = verse {
            VStack(spacing: 20) {
                Text(verse.arabic1)
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Text(verse.english)
                    .font(.body)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isPressed = true
                    }
                    playAudio()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isPressed = false
                        }
                    }
                }) {
                    HStack {
                        Image(systemName: "play.fill")
                            .font(.system(size: 18, weight: .medium))
                        Text("Play Audio")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                    .frame(width: 200)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.purple.opacity(0.9),
                                Color.green.opacity(0.8)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(color: Color.blue.opacity(0.4), radius: 8, x: 0, y: 4)
                    .scaleEffect(isPressed ? 0.95 : 1.0)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
        } else {
            Text("No verse available")
                .font(.body)
                .foregroundColor(.gray)
        }
    }
    
    private func playAudio() {
        guard let audioUrlString = verse?.audio["1"]?.url,
              let url = URL(string: audioUrlString),
              !audioUrlString.isEmpty else {
            print("Invalid or missing audio URL")
            return
        }
        
        player?.pause()
        player = AVPlayer(url: url)
        player?.play()
        print("Playing audio from URL: \(url)")
    }
}

struct VerseContentView_Previews: PreviewProvider {
    static var previews: some View {
        VerseContentView(verse: nil)
    }
}
