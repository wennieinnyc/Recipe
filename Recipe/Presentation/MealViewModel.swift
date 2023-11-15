// Created by Wennie

import Combine
import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []

    private var cancellables = Set<AnyCancellable>()
    private let dessertProvider: DessertProvider

    init(dessertProvider: DessertProvider) {
        self.dessertProvider = dessertProvider
        loadMeals()
    }

    private func loadMeals() {
        dessertProvider.getMeals()
            .sink { _ in

            } receiveValue: { [weak self] returnedMeals in
                self?.meals = returnedMeals.sorted { $0.strMeal.lowercased() < $1.strMeal.lowercased() }
            }
            .store(in: &cancellables)
    }
}
