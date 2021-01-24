//
//  AppDelegate.swift
//  IOSINT6_HomeWork1_1
//
//  Created by Михаил Ильченко on 14.12.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        print("Запуск приложения")
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let initialController = CustomTabBarController()
        window?.rootViewController = initialController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("Другое приложение или кнопка Home")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Приложение в состоянии Active")
        endBackgroundTask()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        registerBackgroundTask()
        print("Переход в состояние Background")
        
        //Примерное время выполнения приложения в бекграунде 25 секунд
        //Но при запуске UIApplication.shared.backgroundTimeRemaining указывается, что приложение живет 30 секунд в бекграунде
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Переход из Background в Foreground")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("Пользователь закрыл приложение")
    }
    
    var backgroundTask: UIBackgroundTaskIdentifier = .invalid
    
    func registerBackgroundTask() {
      backgroundTask = UIApplication.shared.beginBackgroundTask { [weak self] in
        self?.endBackgroundTask()
      }
      assert(backgroundTask != .invalid)
    }
    
    func endBackgroundTask() {
      print("Background task ended.")
      UIApplication.shared.endBackgroundTask(backgroundTask)
      backgroundTask = .invalid
    }
}

