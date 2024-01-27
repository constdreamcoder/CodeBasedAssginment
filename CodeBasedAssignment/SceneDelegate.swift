//
//  SceneDelegate.swift
//  CodeBasedAssignment
//
//  Created by SUCHAN CHANG on 1/27/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let firstTabNav = UINavigationController(rootViewController: FirstTabBarViewController())
        let secondTabNav = UINavigationController(rootViewController: SecondTabBarViewController())
        let thirdTabNav = UINavigationController(rootViewController: ThirdTabBarViewController())
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstTabNav, secondTabNav, thirdTabNav], animated: true)
        tabBarController.tabBar.backgroundColor = .darkGray
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        if let items = tabBarController.tabBar.items {
            items[0].title = "홈"
            items[0].image = UIImage(systemName: "house")
            items[0].selectedImage = UIImage(systemName: "house.fill")
            
            items[1].title = "NEW & HOT"
            items[1].image = UIImage(systemName: "play.square.stack")
            items[1].selectedImage = UIImage(systemName: "play.square.stack.fill")
            
            items[2].title = "저장한 콘텐츠 목록"
            items[2].image = UIImage(systemName: "arrow.down.circle")
            items[2].selectedImage = UIImage(systemName: "arrow.down.circle.fill")
        }
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

