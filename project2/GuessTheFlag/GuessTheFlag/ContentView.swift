//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Zoha Rehan on 2023-07-17.
//

// Buttons
 
import SwiftUI

struct ContentView: View {
    //  we need two properties to store our game data: an array of all the country images we want to show in the game, plus an integer storing which country image is correct.
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        // prompt for guessing the flag
        VStack(spacing: 30){
//            VStack {
//                Text("Tap the flag of")
//                Text(countries[correctAnswer])
//            }
            
            ForEach(0..<3) { number in
                Button {
                    // flag was tapped
                } label: {
                    Image(countries[number])
                        .renderingMode(.original)
                }
            }
            
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
