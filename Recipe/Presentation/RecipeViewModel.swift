// Created by Wennie

import Combine
import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipe: Recipe?

    var cancellables = Set<AnyCancellable>()
    let recipeProvider: RecipeProvider

    init(idMeal: String, recipeProvider: RecipeProvider) {
        self.recipeProvider = recipeProvider
        getRecipe(idMeal: idMeal)
    }

    private func getRecipe(idMeal: String) {
        recipeProvider.getRecipe(idMeal: idMeal)
            .sink(receiveCompletion: { completion in
                      switch completion {
                      case .finished:
                          break
                      case let .failure(error):
                          print("Error: \(error)")
                      }
                  },
                  receiveValue: { [weak self] returnedRecipe in
                      self?.recipe = returnedRecipe.first
                  })
            .store(in: &cancellables)
    }
}
