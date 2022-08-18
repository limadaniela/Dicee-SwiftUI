//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Daniela Lima on 2022-07-28.
//

import SwiftUI

struct ContentView: View {
    
    //@State is a property wrapper to allow us to modify values inside a struct
    //which would normally not be allowed because structs are value types
    //SwiftUI knows that it needs to track leftDiceNumber and rightDiceNumber, then when the number changes,
    //SwiftUIwill rebuild the entire ContentView, so that we can see the change on screen
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                //horizontal padding to have some space from side edges
                .padding(.horizontal)
                Spacer()
                //action is where we determine what should happen when the button gets pressed
                Button(action: {
                    //inside a closure add self keyword
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                    
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        //padding for text to have some spacing before reaches the edges of the button
                        .padding(.horizontal)
                }
                .background(Color.red)
                .padding()
            }
        }
    }
}

//resusable View (extracted)
struct DiceView: View {
    
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
