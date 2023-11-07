// Created by Wennie

import Combine
import Foundation

class MealDataService: DessertProvider {
    let httpsService: HttpsService

    init(HttpsService: HttpsService) {
        self.httpsService = HttpsService
    }

    func getMeals() -> AnyPublisher<[Meal], Error> {
        let mealResponse: AnyPublisher<MealsResponse, Error> = httpsService.getData(url: URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!)
        return mealResponse.map(\.meals).eraseToAnyPublisher()
    }
}

struct MealsResponse: Codable {
    let meals: [Meal]
}
