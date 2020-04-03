//
//  ContentView.swift
//  DiceRoller
//
//  Created by 王瑋 on 2020/4/3.
//  Copyright © 2020 王瑋. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var result : Int = 1
    @State private var schedule = ["翹課＆補習＆打球","上課＆補習＆打球"
        ,"上課＆補習＆不打球","上課＆不補習＆直接回家","上課＆不補習＆打球","上課＆補習＆回家"]
    @State private var showAlert = false
    var body: some View {
        ZStack{
            Image("thinking")
            .resizable()
            .frame(width:300, height:500)
            Text("今日選擇？？？")
                .font(.system(size: 50))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .background(Color.yellow)
                .cornerRadius(10.0)
                .offset(x:0, y:-300)
            ZStack{
                Text("\(result)")
                    .font(.system(size: 150))
                    //.foregroundColor(Color.black)
                    .offset(x:15, y:-415)
                Button(action:{
                    let randNum = 1...6
                    self.result = randNum.randomElement()!
                    self.showAlert = true
                }){
                    Text("Touch")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(40)
                }
            }.offset(x:0, y:300)
                .alert(isPresented: $showAlert) { () -> Alert in
                    return Alert(title: Text("今日行程："), message:Text(schedule[result-1]),dismissButton: .destructive(Text("OK"), action: {
                        print("OK")
                    }))
            }
            
        }
        .background(Color(red:91/255, green:179/255, blue:199/255)
        .edgesIgnoringSafeArea(.all)
        .frame(width:430,height:890)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
