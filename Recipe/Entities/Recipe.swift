// Created by Wennie

import Foundation

struct Recipe: Codable, Identifiable, Equatable {
    var id: String = UUID().uuidString
    let idMeal: String
    let strMeal: String?
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?

    enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strDrinkAlternate
        case strCategory
        case strArea
        case strInstructions
        case strMealThumb
        case strTags
        case strYoutube
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
        case strSource
        case strImageSource
        case strCreativeCommonsConfirmed
        case dateModified
    }

    func getIngrediantsAndMeasures() -> [(String, String)] {
        var ingredientsAndMeasures: [String: String] = [:]
        let mirror = Swift.Mirror(reflecting: self)

        for child in mirror.children {
            guard let ingredientCandidate = child.label else { continue }
            if ingredientCandidate.contains("Ingredient") {
                let splitted = ingredientCandidate.split(separator: "Ingredient")
                var ingredientNumber = ""
                if splitted.count == 2 {
                    ingredientNumber = String(splitted[1])
                }
                // Find a Measure with the same number
                for child2 in mirror.children {
                    guard let measureCandidate = child2.label else { continue }
                    if measureCandidate.contains("Measure") {
                        let splitted = measureCandidate.split(separator: "Measure")
                        var measureNumber = ""
                        if splitted.count == 2 {
                            measureNumber = String(splitted[1])
                        }
                        // Add measures and ingredients to dictionalry
                        if ingredientNumber == measureNumber {
                            if let ingredient = child.value as? String, let measure = child2.value as? String {
                                if (child.value as! String).trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
                                    ingredientsAndMeasures[ingredient] = measure
                                }
                            }
                        }
                    }
                }
            }
        }
        return sortDictionaryToTuples(ingredientsAndMeasures)
    }

    func sortDictionaryToTuples(_ dict: [String: String]) -> [(String, String)] {
        let sortedKeys = dict.keys.sorted()
        var tupleArray: [(String, String)] = []
        for key in sortedKeys {
            if let value = dict[key] {
                tupleArray.append((key, value))
            }
        }
        return tupleArray
    }

    func splitTextIntoParagraphs(_ text: String) -> [String] {
        let paragraphs = text.components(separatedBy: "\r\n")
        let nonEmptyParagraphs = paragraphs.filter { !$0.isEmpty }
        return nonEmptyParagraphs
    }
}

