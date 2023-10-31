//Created by Wennie

import SwiftUI

@main
struct RecipeApp: App, MealViewFactoryDelegate {
    func makeMealView() -> MealView {
        MealView(vm: MealViewModel(dessertProvider: MealDataService()), factory: )
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(delegate: self)
        }
    }
}

