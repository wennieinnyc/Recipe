//Created by Wennie

import SwiftUI

@main
struct RecipeApp: App, MealViewDelegate {
    func makeDessertView() -> DessertView {
        DessertView(vm: MealViewModel(dessertProvider: MealDataService()))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(delegate: self)
        }
    }
}
