//
//  StoryView.swift
//  StoryTellingNFC
//
//  Created by Nicky on 14/12/2023.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundbos")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                ZStack{
                    VStack{
                        Image("_video_")
                            .resizable()
                            .frame(width: 256, height: 171)
                        Text("Attention young adventurers‼️ Red Riding Hood has been captured by the wolf🐺, and it's up to you to rescue her. Go through the magical sprookjesbos🌳 to solve puzzles🧩 to collect clues to find out how to lead Red Riding Hood's to a safe return🏡. Are you ready for the challenge? Let the adventure begin!✨")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .frame(width: 250, height: 280)
                        NavigationLink(destination: Game1View()) {
                            Text("➡️ 🏁")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.pink)
                                .cornerRadius(10)
                        }
                    }
                }  .navigationBarHidden(true)
            }
        }
            }
        }
   

#Preview {
    StoryView()
}
