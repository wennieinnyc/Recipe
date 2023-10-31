//Created by Wennie

import Foundation
import Combine

protocol DessertProvider {
    func getDesserts() -> AnyPublisher<[Meal], Error>
}

protocol RecipeProvider {
    func getRecipe(idMeal: String) -> AnyPublisher<[Recipe], Error>
}
