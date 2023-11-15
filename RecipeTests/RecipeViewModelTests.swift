//Created by Wennie

import XCTest
@testable import Recipe
import Combine

final class RecipeViewModelTests: XCTestCase {
    
    typealias MockRecipeProviderResult = Result<[Recipe], Error>

    enum TestError: Error {
        case unknown
    }

    struct MockRecipeProvider: RecipeProvider {
        let result: MockRecipeProviderResult
        func getRecipe(idMeal: String) -> AnyPublisher<[Recipe], Error> {
            switch result{
                case.success(let recipe):
                    return Just(recipe)
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                case.failure(let error):
                    return Fail<[Recipe], Error>(error: error)
                        .eraseToAnyPublisher()
            }
        }
    }

    func test_init_setsRecipeToEmpty_whenProviderErrors() {
        let sut = RecipeViewModel(idMeal: "", recipeProvider: MockRecipeProvider(result: .failure(TestError.unknown)))
        XCTAssertNil(sut.recipe)
    }

    func test_init_setsRecipeToProviderGetRecipe() {
        let expectedRecipe = Recipe(idMeal: "1",
                                   strMeal: "Chocolate Cake",
                                   strDrinkAlternate: "",
                                   strCategory: "",
                                   strArea: "",
                                   strInstructions: "",
                                   strMealThumb: "",
                                   strTags: "cake",
                                   strYoutube: "",
                                   strIngredient1: "egg",
                                   strIngredient2: "",
                                   strIngredient3: "",
                                   strIngredient4: "",
                                   strIngredient5: "",
                                   strIngredient6: "",
                                   strIngredient7: "",
                                   strIngredient8: "",
                                   strIngredient9: "",
                                   strIngredient10: "",
                                   strIngredient11: "",
                                   strIngredient12: "",
                                   strIngredient13: "",
                                   strIngredient14: "",
                                   strIngredient15: "",
                                   strIngredient16: "",
                                   strIngredient17: "",
                                   strIngredient18: "",
                                   strIngredient19: "",
                                   strIngredient20: "",
                                   strMeasure1: "1",
                                   strMeasure2: "",
                                   strMeasure3: "",
                                   strMeasure4: "",
                                   strMeasure5: "",
                                   strMeasure6: "",
                                   strMeasure7: "",
                                   strMeasure8: "",
                                   strMeasure9: "",
                                   strMeasure10: "",
                                   strMeasure11: "",
                                   strMeasure12: "",
                                   strMeasure13: "",
                                   strMeasure14: "",
                                   strMeasure15: "",
                                   strMeasure16: "",
                                   strMeasure17: "",
                                   strMeasure18: "",
                                   strMeasure19: "",
                                   strMeasure20: "",
                                   strSource: "",
                                   strImageSource: "",
                                   strCreativeCommonsConfirmed: "",
                                   dateModified: "")
        let sut = RecipeViewModel(idMeal: "1", recipeProvider: MockRecipeProvider(result: .success([expectedRecipe])))

        XCTAssert(sut.recipe == expectedRecipe)
        XCTAssert(sut.recipe?.strIngredient1 == "egg")
    }
}
