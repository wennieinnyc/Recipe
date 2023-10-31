//Created by Wennie

import Foundation
import Combine

class RecipeViewModel: ObservableObject {

    @Published var recipe: Recipe?

    var cancellables = Set<AnyCancellable>()

    init(idMeal: String) {
        getRecipe(idMeal: idMeal)
    }

    func getRecipe(idMeal: String) {
        RecipeDataService.instance.getRecipe(idMeal: idMeal)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error: \(error)")
                }
            },
                receiveValue: { [weak self] returnedRecipe in
                self?.recipe = returnedRecipe.first
            })
            .store(in: &cancellables)
    }
    
}
