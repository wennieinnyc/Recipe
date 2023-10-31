//Created by Wennie

import Foundation
import Combine

protocol DessertProvider {
    func getDesserts() -> AnyPublisher<[Meal], Error>
}

protocol RecipeProvider {
    func getRecipe(idMeal: String) -> AnyPublisher<[Recipe], Error>
//    func fetch<T: Decodable>(_ type: T.Type, urlString: String, id: String?)  async throws -> T?
}
