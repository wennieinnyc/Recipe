// Created by Wennie

import Combine
import SwiftUI

struct RecipeView: View {
    @ObservedObject var vm: RecipeViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                if let mealImage = vm.recipe?.strMealThumb {
                    MealImageView(mealImage: mealImage, imageSize: 250, cornerRadius: 0, padding: 5)
                }
                Text(vm.recipe?.strMeal ?? "")
                    .font(.system(size: 25)).bold()

                if let instructions = vm.recipe?.strInstructions {
                    let paragraphs = vm.recipe?.splitTextIntoParagraphs(instructions) ?? []
                    InstructionsView(instructions: paragraphs, title: "Instructions")
                }

                IngredientsAndMeasuresTableView(title: "Ingredients", ingredientsAndMeasures: vm.recipe?.getIngrediatnsAndMeasures() ?? [("", "")])
            }
        }
        .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10))
    }
}

#Preview {
    RecipeView(vm: RecipeViewModel(idMeal: "1", recipeProvider: PreviewRecipeProvider()))
}

struct PreviewRecipeProvider: RecipeProvider {
    func getRecipe(idMeal _: String) -> AnyPublisher<[Recipe], Error> {
        Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
