// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Combine

public struct ProfileSDK {
    
    public static func showCreateProfileView() {
        
        let vc = UIHostingController(rootView: CreateProfileView())
        vc.modalPresentationStyle = .fullScreen
        UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true)
    }
    
    public static var profile: Contact {
        
        if let contactData = UserDefaults.standard.object(forKey: "profile_info") as? Data {
            let decoder = PropertyListDecoder()
            if let contact = try? decoder.decode(Contact.self, from: contactData) {
                return contact
            }
            return Contact()
        }
        return Contact()
    }
}
