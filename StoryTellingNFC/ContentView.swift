//
//  ContentView.swift
//  StoryTellingNFC
//
//  Created by Nicky on 06/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack(alignment: .center) {
                Image("princessbg")
                    .resizable()
                    .aspectRatio(contentMode: .fill
                                 
                    )
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Welcome to de Boswachters")
                        .font(.system(size: 30)
                            .weight(.heavy)
)
                        .foregroundColor(.pink)
                        .shadow(color: .black, radius: 3)
                        .frame(width: 300, height: 400)
                        .multilineTextAlignment(.center)
                      .padding(50)
           
                    
                    
                    
                    
                    NavigationLink (destination: ScanningNFCView ()) {
                    
                            Text ("Get Started")
                            .padding()
                            .background(.yellow)
                            .cornerRadius(10)
                            .foregroundColor(.pink)
                      
                    }

                    
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
