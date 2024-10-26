//
//  SceneDelegate.swift
//  NewsToday
//
//  Created by Александр Гуркин on 26.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        start()
    }
    
    private func start() {
        setRootViewController(makeTabbar())
    }
    
    func setRootViewController(_ controller: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = controller
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = controller
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
    
    private func makeAuth() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .green
        return UINavigationController(rootViewController: controller)
    }
    
    private func makeOnboarding() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .red
        return UINavigationController(rootViewController: controller)
    }
    
    private func makeTabbar() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .blue
        return controller
    }
}

