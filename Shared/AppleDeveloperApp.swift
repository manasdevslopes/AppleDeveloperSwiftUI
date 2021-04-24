//
//  AppleDeveloperApp.swift
//  Shared
//
//  Created by MANAS VIJAYWARGIYA on 17/04/21.
//

import SwiftUI

@main
struct AppleDeveloperApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
