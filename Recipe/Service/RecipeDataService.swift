// Created by Wennie

import Combine
import Foundation

struct RecipeDataService: RecipeProvider {
    static let instance = RecipeDataService()

    func getRecipe(idMeal: String) -> AnyPublisher<[Recipe], Error> {
        let recipeResponse: AnyPublisher<RecipeResponse, Error> = HttpsService.getData(url: URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)")!)
        return recipeResponse.map(\.meals).eraseToAnyPublisher()
    }
}
