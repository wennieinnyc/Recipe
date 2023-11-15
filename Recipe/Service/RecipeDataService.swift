// Created by Wennie

import Combine
import Foundation

struct RecipeDataService: RecipeProvider {
    let httpsService: URLSessionHttpsService

    init(HttpsService: URLSessionHttpsService) {
        self.httpsService = HttpsService
    }
    private let baseURL = "https://themealdb.com/api/json/v1/1/lookup.php"

    func getRecipe(idMeal: String) -> AnyPublisher<[Recipe], Error> {
        guard let url = makeURL(with: idMeal) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        let recipeResponse: AnyPublisher<RecipeResponse, Error> = httpsService.getData(url: url)
        return recipeResponse.map(\.meals).eraseToAnyPublisher()
    }

    private func makeURL(with idMeal: String) -> URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.queryItems = [
            URLQueryItem(name: "i", value: idMeal)
        ]

        return urlComponents?.url
    }
}

struct RecipeResponse: Codable {
    let meals: [Recipe]
}
