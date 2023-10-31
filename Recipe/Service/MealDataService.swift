//Created by Wennie

import Foundation
import Combine

class MealDataService: DessertProvider {

    static let instance = MealDataService()

    func getDesserts() -> AnyPublisher<[Meal], Error> {
        let mealResponse: AnyPublisher<MealsResponse, Error> = HTTPsService.getData(url: URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!)
        return mealResponse.map(\.meals).eraseToAnyPublisher()
        
    }
    
}

