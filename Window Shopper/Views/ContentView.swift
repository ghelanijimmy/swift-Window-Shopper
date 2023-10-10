//
//  ContentView.swift
//  Window Shopper
//
//  Created by Jimmy Ghelani on 2023-10-10.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var hourlyWageText: String = ""
    @State private var itemPrice: String = ""
    @FocusState private var isFocused: Bool
    @State private var shouldButtonAppear: Bool = false
    @State private var calculatedHours: String = "0"
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack {
                Image(.windowShopperIcon)
                    .padding(.bottom, 53)
                
                ZStack(alignment: .leading) {
                    CustomTextField(title: "Hourly Wage", text: $hourlyWageText, keyboard: .decimalPad, isFocused: _isFocused, shouldButtonAppear: $shouldButtonAppear)
                        .padding()
                    
                    Text(Locale.current.currencySymbol ?? "")
                        .foregroundStyle(.white)
                        .padding()
                        .padding(.leading, 10)
                }
                
                ZStack(alignment: .leading) {
                    CustomTextField(title: "Item Price", text: $itemPrice, keyboard: .decimalPad, isFocused: _isFocused, shouldButtonAppear: $shouldButtonAppear)
                        .padding()
                    
                    Text(Locale.current.currencySymbol ?? "")
                        .foregroundStyle(.white)
                        .padding()
                        .padding(.leading, 10)
                }
                
                Text(calculatedHours)
                    .font(.system(size: 52))
                    .foregroundStyle(.white)
                
                Text("Hours")
                    .foregroundStyle(.white)
                
                Spacer()
                
                if isFocused {
                    Button(action: {
                        if let wage = Double(hourlyWageText),
                        let price = Double(itemPrice) {
                            let hours = Wage.getHours(forWage: wage, andPrice: price)
                            calculatedHours = String(hours)
                        }
                    }, label: {
                        Text("Calculate")
                    })
                    .frame(width: UIScreen.main.bounds.width, height: 60)
                    .background(.yellow)
                    .opacity(shouldButtonAppear ? 1 : 0)
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                } else {
                    Button(action: {
                        hourlyWageText = ""
                        itemPrice = ""
                        calculatedHours = "0"
                    }, label: {
                        Text("Clear Calculator")
                            .foregroundStyle(.white)
                    })
                    .opacity(shouldButtonAppear ? 0 : 1)
                }
            }
            .padding()
            .padding(.horizontal, 20)
            
        }
        .background(
            Image(.windowShopperBG)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea(.all)
        )
        .onTapGesture(perform: {
            isFocused = false
        })
    }
}

#Preview {
    ContentView()
}
