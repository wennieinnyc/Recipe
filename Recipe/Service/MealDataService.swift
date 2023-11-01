// Created by Wennie

import Combine
import Foundation

class MealDataService: DessertProvider {
    static let instance = MealDataService()

    func getMeals() -> AnyPublisher<[Meal], Error> {
        let mealResponse: AnyPublisher<MealsResponse, Error> = HttpsService.getData(url: URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!)
        return mealResponse.map(\.meals).eraseToAnyPublisher()
    }
}
