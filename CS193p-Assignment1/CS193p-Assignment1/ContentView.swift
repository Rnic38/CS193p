//
//  ContentView.swift
//  CS193p-Assignment1
//
//  Created by Ryan Nicolosi on 4/10/23.
//

//This is the original way that I was going to do it but I found a bug that I could not resolve so im keeping this for the future for me to try and resolve. 

import SwiftUI

struct ContentView: View {
    @State var emojisShown : String = "nature"
    @State var defaultArray : [String] = []
    @State var natureEmoji = ["🐢", "🐍", "🦎", "🦐", "🐡", "🐳", "🐋", "🐠", "🐊", "🐟"]
    var foodEmoji = ["🍎", "🍌", "🍓", "🍋", "🍍", "🌶️", "🍊", "🥦", "🧅"]
    var flagEmoji = ["🏴‍☠️", "🏳️‍⚧️", "🏳️‍🌈", "🇸🇪", "🇹🇼", "🇭🇰", "🇮🇹", "🇺🇸"]
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
                .padding(.bottom, 10)
            Spacer()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
                    ForEach(defaultArray, id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fill)
                        }
                }.padding(.horizontal, 10)
                }.foregroundColor(.blue)
            
                HStack(alignment: .bottom){
                    natureButton
                    foodButton
                    flagButton
           }
        }.onAppear(){
            cardViewSwitch()
        }
    }
    
    func cardViewSwitch(){
        switch(emojisShown){
        case "nature":
            defaultArray = natureEmoji.shuffled()
        case "food":
            defaultArray = foodEmoji.shuffled()
        case "flag":
            defaultArray = flagEmoji.shuffled()
        default:
            defaultArray = natureEmoji.shuffled()
        }
    }
    
    
    var natureButton : some View {
        VStack{
            Button(action: {
                emojisShown = "nature"
                cardViewSwitch()
            }) {
                VStack {
                    Image(systemName: "tree")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    Text("Nature")
                }
            }
        }
        .padding(.horizontal, 30)
    }
    
    var foodButton : some View{
        VStack{
            Button(action: {
                emojisShown = "food"
                cardViewSwitch()
            }) {
                VStack {
                    Image(systemName: "fork.knife")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    Text("Food")
                }
            }
        }
        .padding(.horizontal, 30)
    }
    
    var flagButton : some View{
        VStack{
            Button(action: {
                emojisShown = "flag"
                cardViewSwitch()
            }) {
                VStack {
                    Image(systemName: "flag")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    Text("Flags")
                }
            }
        }
        .padding(.horizontal, 30)
    }
}

struct CardView : View {
        var content : String
        @State var isFaceUp : Bool = false
        let shape = RoundedRectangle(cornerRadius: 20)
    var body: some View{
        ZStack{
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(.blue, lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onAppear(){
            if(isFaceUp){
                isFaceUp = false
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
