//
//  ContentView.swift
//  ClassWork9
//
//  Created by Bader Alsabah on 5/7/20.
//  Copyright © 2020 Bader Alsabah. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var weight: String = ""
    @State var height:String = ""
    @State var bmi: String = "0.0"
    @State var bmiStatus: String = "-"
    func calculatebmi(weight: Double, height: Double) -> Double{
        return weight / (height*height)
    }
    func bmiStatus(bmi: Double) -> String{
        if bmi < 20 {
            return "Thin"
        } else if bmi < 25{
            return "Good"
        }else{
            return "Obese"
        }
    }
    func calculateBmiAndUpdate() {
        let weight = Double(self.weight)!
        let height = Double(self.height)!
        let bmi = calculatebmi(weight: weight, height: height)
        self.bmi = String(format: "%.1f", bmi)
        self.bmiStatus = self.bmiStatus(bmi: bmi)
    }
    var body: some View {

        
        VStack {
            VStack {
                Text("Welcome To BMI Calculator").bold().font(.system(size: 25))
                TextField("height in (m)", text: $height)
                TextField("weight in kg", text: $weight)
                Button(action: {
                    self.calculateBmiAndUpdate()
                }) {
                    Text("Calculate")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
            }.padding(.all)
            VStack{
                Text("BMI")
                    .font(.largeTitle)
                    .bold()
                Text(bmi)
                    .font(.system(size: 70))
                    .fontWeight(.heavy)
                .padding()
                Text("Status")
                    .font(.largeTitle)
                .bold()
                Text(bmiStatus)
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
