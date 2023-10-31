//Created by Wennie

import Foundation
import Combine

class MealViewModel: ObservableObject {

    @Published var meals: [Meal] = []

    var cancellables = Set<AnyCancellable>()
    let dessertProvider: DessertProvider

    init(dessertProvider: DessertProvider) {
        self.dessertProvider = dessertProvider
        loadMeals()
    }

    private func loadMeals() {
        dessertProvider.getDesserts()
            .sink { _ in

            } receiveValue: { [weak self] returnedMeals in
                self?.meals = returnedMeals.sorted { $0.strMeal.lowercased() < $1.strMeal.lowercased()}
            }
            .store(in: &cancellables)
    }
}


