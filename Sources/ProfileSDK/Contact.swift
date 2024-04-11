//
//  Contact.swift
//
//
//  Created by sam on 11-04-2024.
//

import Foundation
import SwiftUI
import Combine

public struct Contact: Identifiable, Codable {
    
    public var id: UUID = UUID()
    
    public init() {
        
    }
    
    public init(name: String, email: String, phoneNumber: String, imageData: Data?) {
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.imageData = imageData
    }
    
    public var name: String = ""
    public var email: String = ""
    public var phoneNumber: String = ""
    var imageData: Data?
    public var image: UIImage? {
        if let data = imageData {
            return UIImage(data: data, scale: 1.0)
        }
        return nil
    }
}
