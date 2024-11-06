import Foundation

struct NewsDefaults {
    static var isOnboarding: Bool {
        get { UserDefaults.standard.bool(forKey: "isOnboarding") }
        set { UserDefaults.standard.set(newValue, forKey: "isOnboarding") }
    }
    
    static var currentPage: Int {
        get { UserDefaults.standard.integer(forKey: "currentPage")}
        set { UserDefaults.standard.set(newValue, forKey: "currentPage") }
    }
}
