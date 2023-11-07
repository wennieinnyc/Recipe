//Created by Wennie

import SwiftUI

struct MealViewFactory: MealViewMaker {

    func makeRecipeView(idMeal: String) -> AnyView {
        AnyView(erasing: RecipeView(vm: makeRecipeViewModel(idMeal: idMeal)))
    }

    private func makeRecipeViewModel(idMeal: String) -> RecipeViewModel {
        RecipeViewModel(idMeal: idMeal, recipeProvider: makeRecipeProvider())
    }

    private func makeRecipeProvider() -> RecipeProvider {
        RecipeDataService(HttpsService: HttpsService())
    }
}
