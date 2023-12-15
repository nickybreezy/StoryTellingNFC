//
//  ScanningNFCView.swift
//  StoryTellingNFC
//
//  Created by Nicky on 06/12/2023.
//
import SwiftUI
import CoreNFC


extension Color {
    init(hex: UInt) {
        self.init(
            .sRGB,
            red: Double((hex >> 17) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: 1
        )
    }
}

struct ScanningNFCView: View {
    @State private var hardcodedNFCChipID: String? = nil
    @State private var isAlertPresented: Bool = false
    @State private var navigateToGame: Bool = false
    
    
    let sWiftNFC = SWiftNFC()

    var body: some View {
        ZStack {
            Image("treecartoonbg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text(hardcodedNFCChipID != nil ? "Pole has been scanned successfully!" : "Scan the nearest pole...")

                Button(action: { read() }) {
                    Text("Scan the pole")
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .cornerRadius(15)
                .padding()

                if hardcodedNFCChipID != nil {
                    Button(action: {
                        isAlertPresented.toggle()
                    }) {
                        Text("Start Story")
                            .imageScale(.large)
                            .padding()
                            .background(Color.pink.opacity(0.85))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .alert(isPresented: $isAlertPresented) {
                        Alert(
                            title: Text("Attention"),
                            message: Text("Please make sure you are aware of your child(ren) at all times⚠️!"),
                            dismissButton: .default(Text("OK")) {
                                navigateToGame = true
                            }
                        )
                    }
                    .background(
                        NavigationLink(
                            destination: StoryView(),
                            isActive: $navigateToGame
                        ) {
                            EmptyView()
                        }
                        .hidden()
                    )
                }
                
            }
            .padding(10)
            .background(Color(hex: 0xD899A6))
            .cornerRadius(5)
        }
    }

        
        func read() {
            sWiftNFC.onRead = { nfcMsg in
                hardcodedNFCChipID = nfcMsg
            }

            sWiftNFC.read()
        }
    
    }

#Preview {
    ScanningNFCView()
}
