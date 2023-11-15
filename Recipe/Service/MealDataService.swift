// Created by Wennie

import Combine
import Foundation

class MealDataService: DessertProvider {
    let httpsService: HttpsService
    private let mealUrl = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
    init(HttpsService: HttpsService) {
        self.httpsService = HttpsService
    }

    func getMeals() -> AnyPublisher<[Meal], Error> {
        guard let mealUrl = mealUrl else {
               return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        let mealResponse: AnyPublisher<MealsResponse, Error> = httpsService.getData(url: mealUrl)
        return mealResponse.map(\.meals).eraseToAnyPublisher()
    }
}

struct MealsResponse: Codable {
    let meals: [Meal]
}
