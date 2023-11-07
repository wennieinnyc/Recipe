// Created by Wennie

import Combine
import Foundation

struct RecipeDataService: RecipeProvider {
    let httpsService: HttpsService

    init(HttpsService: HttpsService) {
        self.httpsService = HttpsService
    }

    func getRecipe(idMeal: String) -> AnyPublisher<[Recipe], Error> {
        let recipeResponse: AnyPublisher<RecipeResponse, Error> = httpsService.getData(url: URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)")!)
        return recipeResponse.map(\.meals).eraseToAnyPublisher()
    }
}

struct RecipeResponse: Codable {
    let meals: [Recipe]
}
