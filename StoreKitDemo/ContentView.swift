//
//  ContentView.swift
//  StoreKitDemo
//
//  Created by Eugen Soloviov on 25.10.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var unlockManager: UnlockManager
    
    init() {
        let dataController = DataController()
        let unlockManager = UnlockManager(dataController: dataController)

        _dataController = StateObject(wrappedValue: dataController)
        _unlockManager = StateObject(wrappedValue: unlockManager)
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
                .environmentObject(unlockManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
