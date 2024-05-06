//
//  InputField.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import SwiftUI

struct InputField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(.leading, 16)
            .frame(width: 358, height: 46)
            .background(.lightGray)
            .cornerRadius(12.0)
        
    }
}

#Preview {
    InputField(placeholder: "Hello",text: .constant("Hello"))
}
