//Created by Wennie

import Foundation
import Combine

class MealDataServie: DessertProvider {

    static let instance = MealDataServie()

    static func getData<T:Codable>(url: URL) -> AnyPublisher<T, Error> {

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func getDesserts() -> AnyPublisher<[Meal], Error> {
        let mealResponse: AnyPublisher<MealsResponse, Error> = MealDataServie.getData(url: URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!)
        return mealResponse.map(\.meals).eraseToAnyPublisher()
    }
}
