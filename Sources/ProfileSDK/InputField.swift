//
//  InputField.swift
//
//
//  Created by sam on 11-04-2024.
//

import Foundation
import SwiftUI

struct BorderedInputField: View {
    
    @State var label: String
    @Binding var text: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(label)
                .font(.caption)
            TextField("", text: $text)
                .padding(.horizontal)
                .frame(height: 50)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                }
        }.padding(.vertical, 8)
    }
}

struct ProfileImageView: View {
    
    @Binding var image: Data?
    
    var body: some View {
        HStack {
            Spacer()
            if let image = image, let uiImage = UIImage(data: image) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundColor(Color.gray.opacity(0.8))
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundColor(Color.gray.opacity(0.8))
            }
            Spacer()
        }.padding()
    }
}
