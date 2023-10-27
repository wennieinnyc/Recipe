//Created by Wennie

import SwiftUI

@main
struct RecipeApp: App, MealViewDelegate {
    func makeMealView() -> MealView {
        MealView(vm: MealViewModel(dessertProvider: MealDataServie()))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(delegate: self)
        }
    }
}
