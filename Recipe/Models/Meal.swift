// Created by Wennie

import Foundation

struct Meal: Codable, Identifiable {
    var id: String = UUID().uuidString
    let strMeal: String
    let strMealThumb: String
    let idMeal: String

    enum CodingKeys: String, CodingKey {
        case strMeal
        case strMealThumb
        case idMeal
    }
}

struct MealsResponse: Codable {
    let meals: [Meal]
}
