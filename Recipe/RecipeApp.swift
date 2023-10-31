//Created by Wennie

import SwiftUI

@main
struct RecipeApp: App, MealViewDelegate {
    func makeMealView() -> MealView {
        MealView(vm: MealViewModel(dessertProvider: MealDataService()))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(delegate: self)
        }
    }
}
