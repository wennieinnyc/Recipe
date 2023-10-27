//Created by Wennie

import Foundation
import Combine

class MealDataServie {

    static let instance = MealDataServie()

    let url: URL = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!

    func getData() -> AnyPublisher<[Meal], Error> {

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MealsResponse.self, decoder: JSONDecoder())
            .map(\.meals)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
