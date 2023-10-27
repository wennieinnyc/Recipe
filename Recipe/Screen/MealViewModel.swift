//Created by Wennie

import Foundation
import Combine

class MealViewModel: ObservableObject {

    @Published var meals: [Meal] = []
    var cancellables = Set<AnyCancellable>()

    init() {
        loadMeals()
    }

    private func loadMeals() {
        MealDataServie.instance.getData()
            .sink { _ in

            } receiveValue: { [weak self] returnedMeals in
                self?.meals = returnedMeals
            }
            .store(in: &cancellables)

    }
}
