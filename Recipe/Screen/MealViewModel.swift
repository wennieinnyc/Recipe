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
        MealDataServie.instance.getDesserts()
            .sink { _ in

            } receiveValue: { [weak self] returnedMeals in
                self?.meals = returnedMeals
            }
            .store(in: &cancellables)

    }
}

protocol DessertProvider {
    func getDesserts() -> AnyPublisher<[Meal], Error>
}
