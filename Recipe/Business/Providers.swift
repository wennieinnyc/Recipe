// Created by Wennie

import Combine
import Foundation

protocol DessertProvider {
    func getMeals() -> AnyPublisher<[Meal], Error>
}

protocol RecipeProvider {
    func getRecipe(idMeal: String) -> AnyPublisher<[Recipe], Error>
}

protocol HttpsService {
    func getData<T: Codable>(url: URL) -> AnyPublisher<T, Error>
}
