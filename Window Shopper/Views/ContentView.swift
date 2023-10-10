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
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack {
                Image(.windowShopperIcon)
                    .padding(.bottom, 53)
                
                CustomTextField(title: "Hourly Wage", text: $hourlyWageText, keyboard: .decimalPad, isFocused: _isFocused, shouldButtonAppear: $shouldButtonAppear)
                    .padding()
                
                CustomTextField(title: "Item Price", text: $itemPrice, keyboard: .decimalPad, isFocused: _isFocused, shouldButtonAppear: $shouldButtonAppear)
                    .padding()
                
                Spacer()
                
                if isFocused {
                    Button(action: {}, label: {
                        Text("Calculate")
                    })
                    .frame(width: UIScreen.main.bounds.width, height: 60)
                    .background(.yellow)
                    .opacity(shouldButtonAppear ? 1 : 0)
                    .ignoresSafeArea(.keyboard, edges: .bottom)
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
