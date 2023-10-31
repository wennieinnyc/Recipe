//Created by Wennie

import SwiftUI

@main
struct RecipeApp: App, ContentViewFactory, MealViewFactory {
    func makeMealView() -> MealView {
        MealView(vm: MealViewModel(dessertProvider: MealDataService()), factory: self )
    }

    func makeRecipeView(idMeal: String) -> AnyView {
        AnyView (erasing: RecipeView(vm: RecipeViewModel(idMeal: idMeal)))
    }

    var body: some Scene {
        WindowGroup {
            ContentView(factory: self)
        }
    }
}


