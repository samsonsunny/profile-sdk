//
//  ImagePicker.swift
//  
//
//  Created by sam on 11-04-2024.
//

import Foundation
import AVFoundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
        
    @Binding var selectedImage: Data?
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
 
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
 
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(imagePicker: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var imagePicker: ImagePicker
        
        init(imagePicker: ImagePicker) {
            self.imagePicker = imagePicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let data = image.pngData() {
                imagePicker.selectedImage = data
                imagePicker.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
