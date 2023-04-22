////
////  MemorizeView.swift
////  CS193p-Assignment1
////
////  Created by Ryan Nicolosi on 4/21/23.
////
//
//import SwiftUI
//
//struct MemorizeView: View {
//    @State var emojisShown : String = "nature"
//    @State var natureEmoji = ["🐢", "🐍", "🦎", "🦐", "🐡", "🐳", "🐋", "🐠", "🐊", "🐟"]
//    var foodEmoji = ["🍎", "🍌", "🍓", "🍋", "🍍", "🌶️", "🍊", "🫐", "🥦", "🧅"]
//    var flagEmoji = ["🏴‍☠️", "🏳️‍⚧️", "🏳️‍🌈", "🇸🇪", "🇨🇮", "🇹🇼", "🇭🇰", "🇮🇹", "🇺🇸"]
//    
//    var body: some View {
//        VStack{
//            Text("Memorize!")
//                .font(.largeTitle)
//                .padding(.bottom, 10)
//            Spacer()
//            ScrollView{
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
//                    if(emojisShown == "nature"){
//                        natureView
//                    }else if(emojisShown == "food"){
//                        foodView
//                    }else{
//                        flagView
//                    }
//                }.padding(.horizontal, 10)
//                }.foregroundColor(.blue)
//            
//                HStack(alignment: .bottom){
//                    natureButton
//                    foodButton
//                    flagButton
//           }
//        }
//    }
//    
//    var natureView : some View {
//        ForEach(natureEmoji.shuffled(), id: \.self) { emoji in
//            CardView(content: emoji)
//                .aspectRatio(2/3, contentMode: .fill)
//        }
//    }
//    
//    var natureButton : some View {
//        VStack{
//            Button(action: {
//                emojisShown = "nature"
//                natureEmoji.shuffled()
//            }) {
//                VStack {
//                    Image(systemName: "tree")
//                        .font(.largeTitle)
//                        .foregroundColor(.blue)
//                    Text("Nature")
//                }
//            }
//        }
//        .padding(.horizontal, 30)
//    }
//    
//    var foodView : some View {
//        ForEach(foodEmoji, id: \.self) { emoji in
//            CardView(content: emoji)
//                .aspectRatio(2/3, contentMode: .fill)
//        }
//    }
//    
//    var foodButton : some View{
//        VStack{
//            Button(action: {
//                emojisShown = "food"
//                foodEmoji.shuffled()
//            }) {
//                VStack {
//                    Image(systemName: "fork.knife")
//                        .font(.largeTitle)
//                        .foregroundColor(.blue)
//                    Text("Food")
//                }
//            }
//        }
//        .padding(.horizontal, 30)
//    }
//    
//    var flagView : some View {
//        ForEach(flagEmoji, id: \.self) { emoji in
//            CardView(content: emoji)
//                .aspectRatio(2/3, contentMode: .fill)
//        }
//    }
//    
//    var flagButton : some View{
//        VStack{
//            Button(action: {
//                emojisShown = "flag"
//                flagEmoji.shuffled()
//            }) {
//                VStack {
//                    Image(systemName: "flag")
//                        .font(.largeTitle)
//                        .foregroundColor(.blue)
//                    Text("Flags")
//                }
//            }
//        }
//        .padding(.horizontal, 30)
//    }
//}
//
//struct MemorizeView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemorizeView()
//    }
//}
//
//struct CardViewTest : View {
//        var content : String
//        @State var isFaceUp : Bool = true
//        let shape = RoundedRectangle(cornerRadius: 20)
//    var body: some View{
//        ZStack{
//            if isFaceUp{
//                shape.fill().foregroundColor(.white)
//                shape.strokeBorder(.blue, lineWidth: 3)
//                Text(content).font(.largeTitle)
//            } else {
//                shape.fill()
//            }
//        }
//        .onTapGesture {
//            isFaceUp.toggle()
//        }
//    }
//}
