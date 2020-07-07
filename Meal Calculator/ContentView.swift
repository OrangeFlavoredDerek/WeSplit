//
//  ContentView.swift
//  Meal Calculator
//
//  Created by 陈峻琦 on 2020/7/7.
//  Copyright © 2020 derekchan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson:Double{
        let orderAmount = Double(checkAmount) ?? 0
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        let tipValue = orderAmount/100 * tipSelection
        let grandTotal = tipValue + orderAmount
        let amountPerPerson = grandTotal/peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("总金额", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("人数", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0)人")
                        }
                    }
                }
                
                Section(header: Text("选择小费比例")
                    .font(.system(size: 15.5))
                    .foregroundColor(.black)){
                    Picker("小费比例", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Text("每人\(totalPerPerson, specifier: "%.2f")元")
                }
            }
            .navigationBarTitle("WeSplit")
            .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
