//
// namesForLocalizable.swift
//  NewsToday
//
//  Created by Александр Гуркин on 31.10.2024.
//

import Foundation

enum Texts {
    
    enum ProfileViewController {
        
        static var title: String { NSLocalizedString("profileViewController title", comment: "") }
//        static var subtitle: String { NSLocalizedString("first controller subtitle", comment: "") }
        static var signOutButton: String { NSLocalizedString("profileViewController sing out button", comment: "") }
        static var termsConditionsButton: String { NSLocalizedString("profileViewController terms Conditions button", comment: "") }
        static var languageButton: String { NSLocalizedString("profileViewController language button", comment: "") }
    }
    
    enum TermsViewController {
        
        static var title: String { NSLocalizedString("termsViewController title", comment: "") }
//        static var subtitle: String { NSLocalizedString("second controller subtitle", comment: "") }
//        static var action_button: String { NSLocalizedString("second controller action button", comment: "") }
//        static var cancel_button: String { NSLocalizedString("second controller cancel button", comment: "") }
    }
    
    enum LanguageViewController {
        
        static var title: String { NSLocalizedString("languageViewController title", comment: "") }
//        static var subtitle: String { NSLocalizedString("second controller subtitle", comment: "") }
        static var engButton: String { NSLocalizedString("languageViewController english button", comment: "") }
        static var rusButton: String { NSLocalizedString("languageViewController russian button", comment: "") }
    }
    
    static func fruitName(name: String) -> String {
        return String(format: NSLocalizedString("fruit name %@", comment: ""), name)
    }
    
}




