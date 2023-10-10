//
//  CustomTextField.swift
//  Window Shopper
//
//  Created by Jimmy Ghelani on 2023-10-10.
//

import SwiftUI

struct CustomTextField: View {
    // MARK: - PROPERTIES
    let title: String
    @Binding var text: String
    let keyboard: UIKeyboardType
    @FocusState var isFocused: Bool
    @Binding var shouldButtonAppear: Bool
    
    // MARK: - BODY
    var body: some View {
        TextField("", text: $text, prompt: Text(title).foregroundStyle(.white.opacity(0.5)))
            .padding()
            .background(.white.opacity(0.25))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5.0))
            .multilineTextAlignment(.center)
            .keyboardType(keyboard)
            .focused($isFocused)
            .onChange(of: isFocused) { oldValue, newValue in
                withAnimation(.easeInOut) {
                    shouldButtonAppear = newValue
                }
            }
    }
}

#Preview {
    @State var text: String = ""
    @FocusState var isFocused: Bool
    @State var shouldButtonAppear: Bool = false
    return ZStack {
        CustomTextField(title: "Custom Text Field", text: $text, keyboard: .default, isFocused: _isFocused, shouldButtonAppear: $shouldButtonAppear)
            .padding()
    }
    .background(Image(.windowShopperBG))
}
