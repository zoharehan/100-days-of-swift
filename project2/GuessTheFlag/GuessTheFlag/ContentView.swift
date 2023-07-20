//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Zoha Rehan on 2023-07-17.
//

// Challenges:
// 1. Add an @State property to store the user’s score, modify it when they get an answer right or wrong, then display it in the alert and in the score label.
// 2. When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.
// 3. Make the game show only 8 questions, at which point they see a final alert judging their score and can restart the game.
 
import SwiftUI

struct ContentView: View {
    //  we need two properties to store our game data: an array of all the country images we want to show in the game, plus an integer storing which country image is correct.
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
//     alert to show the score
    @State private var showingScore = false
    
//    title of the score alert
    @State private var scoreTitle = ""
    
//    Score so far, every correct guess is 10 points
    @State private var score = 0
    
//    number of questions asked so far
    @State private var numberOfQuestions = 0
    
//    whether the final alert and restart should happen
    @State private var showingFinalAlert = false

    var body: some View {
        // we are using this to add a background colour.
        ZStack {
                        LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                            .ignoresSafeArea()
//            RadialGradient(stops: [
//                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
//                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
//            ], center: .top, startRadius: 200, endRadius: 400)
//            .ignoresSafeArea()
            // we want a spacing of 30 between the text prompt and the flags.
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack(spacing: 15){
                    VStack {
                        // prompt for guessing the flag
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            turnCount()
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                            // Button added asking if we want to continue and then resetting the game.
                        }.alert(scoreTitle, isPresented: $showingScore) {
                            Button("Continue", action: askQuestion)
                        } message: {
                            Text("Your score is \(score)")
                        }.clipShape(Capsule()).shadow(radius: 5).alert("Game Over", isPresented: $showingFinalAlert) {
                            Button("Restart", action: resetGame)
                        } message: {
                            Text("Your final score is \(score)")
                        }
                    }
                    
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }.padding()
            
            
        }
    }
    
    func flagTapped(_ number: Int) -> Void {
        if number == correctAnswer {
            score += 10
            scoreTitle = "Correct!"
            
        } else {
            scoreTitle = "Wrong. \n That's the flag of \(countries[number])."
        }
        showingScore = true
        
    }
    
    
    //  method that resets the game by shuffling up the countries and picking a new correct answer
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func turnCount() -> Void {
        numberOfQuestions += 1
        if numberOfQuestions == 8 {
            showingFinalAlert = true
//            restart the game.
            numberOfQuestions = 0
        }
    }
    
    func resetGame() -> Void {
        numberOfQuestions = 0
        score = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
