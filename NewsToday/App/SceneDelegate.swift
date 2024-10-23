//
//  SceneDelegate.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 20.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = OnboardingPageController()
        window?.makeKeyAndVisible()
    }
}

