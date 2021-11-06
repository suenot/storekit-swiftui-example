//
//  DataController.swift
//  StoreKitDemo
//
//  Created by Eugen Soloviov on 29.10.2021.
//

import CoreData
import CoreSpotlight
import StoreKit
import SwiftUI
import UserNotifications

class DataController: ObservableObject {
    let container: NSPersistentCloudKitContainer
    
    // The UserDefaults suite where we're saving user data.
    let defaults: UserDefaults
    
    
    /// - Parameter defaults: The UserDefaults suite where user data should be stored
    init(inMemory: Bool = false, defaults: UserDefaults = .standard) {
        self.defaults = defaults
//        container = NSPersistentCloudKitContainer(name: "Main", managedObjectModel: Self.model)
        container = NSPersistentCloudKitContainer(name: "Main")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
            
        }
    }

    // Loads and saves whether our premium unlock has been purchased.
    var fullVersionUnlocked: Bool {
        get {
            UserDefaults.standard.bool(forKey: "fullVersionUnlocked")
        }

        set {
            UserDefaults.standard.set(newValue, forKey: "fullVersionUnlocked")
        }
    }
    
    func appLaunched() {
        let allScenes = UIApplication.shared.connectedScenes
        let scene = allScenes.first { $0.activationState == .foregroundActive }

        if let windowScene = scene as? UIWindowScene {
            SKStoreReviewController.requestReview(in: windowScene)
        }
    }
}
