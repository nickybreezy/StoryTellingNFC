//
//  Game1View.swift
//  StoryTellingNFC
//
//  Created by Nicky on 07/12/2023.
//
import SwiftUI
extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

struct Game1View: View {
    @State private var isCorrectAnswer: Bool? = nil
    @State var showingPopup = false // 1
    @State private var popupPosition: CGPoint = .zero
    
    var body: some View {
        ZStack {
            Image("backgroundbos")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Text("Who is the fairy with a magical wand and a penchant for granting wishes?")
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(10)
                        .background(Color(UIColor(hex: "#32381A")))
                        .cornerRadius(5)
                
                Spacer()
                
                HStack(spacing: 10) {
                    Button(action: {
                        checkAnswer("Pardoes")
                        showingPopup = true
                    }) {
                        Text("Pardoes")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.pink.opacity(0.85))
                            .cornerRadius(15)
                    }.popover(isPresented: $showingPopup, arrowEdge: .bottom) {
                        ZStack {
                            
                            VStack {
                                Spacer()
                                Image("Pardoes")
                                    .resizable()
                                    .frame(width: 258, height: 216)
                                
                                
                                HStack{
                                    Text("Correct! my magic wand tells me you need to go to the tree for the next clue, take mine to lead the way! (1/5 elements collected)")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                        .frame(width: 250, height: 200)
                                    Image("wand")
                                        .resizable()
                                        .frame(width: 50, height: 150)
                                }
                                .padding(20)
                                Spacer()
                            }
                            .frame(width: 350, height: 350)
                            .background(Color(UIColor(hex: "#F7CEBF")))
                            .presentationDetents([.height(450)])
                            .cornerRadius(15)
                            Spacer()
                      
                        }  .frame(width: 450, height: 450)
                        .background(Color(UIColor(hex: "#DA7F96")))
                       
                    }
                    
                    
                    Button(action: {
                        // Action for the "boom" button
                        checkAnswer("boom")
                    }) {
                        Text("Elfje")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.pink.opacity(0.85))
                            .cornerRadius(15)
                    }
                    
                    Button(action: {
                        // Action for the "troll" button
                        checkAnswer("troll")
                    }) {
                        Text("Kabouter")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.pink.opacity(0.85))
                            .cornerRadius(15)
                    }
                }
                .padding(20)
                if let isCorrectAnswer = isCorrectAnswer {
                    Text(isCorrectAnswer ? "Correct! Pardoes is the mischievous fairy!" : "Incorrect answer. Try again.")
                        .foregroundColor(isCorrectAnswer ? .green : .red)
                    Image(isCorrectAnswer ? "Pardoes" : "")
                        .resizable()
                        .frame(width: 250, height: 200)
                   
                }
                Spacer()
            }.navigationBarHidden(true)
        }
    }
    func checkAnswer(_ selectedAnswer: String) {
          // Check if the selected answer is correct
          isCorrectAnswer = selectedAnswer.lowercased() == "pardoes"
      }
}


#Preview {
    Game1View()
}
