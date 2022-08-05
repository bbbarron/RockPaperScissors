//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Barry Barron on 8/4/22.
//  from Hacking With SwiftUI - HWS
//  Project 3 Day 25
//

import SwiftUI

struct ContentView: View {
    let moves = ["✊", "✋", "✌️"]

    @State private var computerChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var questionCount = 1
    @State private var showingResults = false
    
    var body: some View {
        VStack {
            Spacer()

            Text("Computer has played…")
                .font(.headline)
            
            Text(moves[computerChoice])
                .font(.system(size: 200))

            if shouldWin {
                Text("Which one wins?")
                    .foregroundColor(.green)
                    .font(.title)
            } else {
                Text("Which one loses?")
                    .foregroundColor(.red)
                    .font(.title)
            }

            HStack {
                ForEach(0..<3) { number in
                    Button(moves[number]) {
                        play(choice: number)
                    }
                    .font(.system(size: 80))
                }
                    
            }

            Spacer()
          
            Text("Score: \(score)")
                .font(.headline)

            Spacer()
        }
        .alert("GAME OVER", isPresented: $showingResults) {
            Button("Play Again?", action: reset)
        } message: {
            Text("Your Score was \(score)")
        }
    }
    
    func play(choice: Int) {
        let winningMoves = [1, 2, 0]
        let didWin: Bool
        // more code to come
        
        if shouldWin {
            didWin = choice == winningMoves[computerChoice]
        }  else {
            didWin = winningMoves[choice] == computerChoice
        }
        if didWin {
            score += 1
        } else {
            score -= 1
        }
        
        if questionCount == 10 {
            showingResults = true
        } else {
            computerChoice = Int.random(in: 0..<3)
            shouldWin.toggle()
            questionCount += 1
        }
    }
    
    func reset() {
        computerChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        questionCount = 0
        score = 0
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
