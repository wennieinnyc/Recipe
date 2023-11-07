// Created by Wennie

import Combine
@testable import Recipe
import XCTest

final class RecipeTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func test_getMeals_receive64Meals() {
//        let mealService = MealDataService()
//
//        let expectation = self.expectation(description: "Get all 64 meals")
//        var receivedMeals: [Meal]?
//
//        let cancellable = mealService.getMeals()
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    break // Test successful completion
//                case .failure:
//                    XCTFail("Unexpected error")
//                }
//                expectation.fulfill()
//            }, receiveValue: { meals in
//                receivedMeals = meals
//            })
//
//        waitForExpectations(timeout: 5, handler: nil)
//
//        XCTAssertEqual(receivedMeals?.count, 64)
//
//        cancellable.cancel()
//    }
//
//    func test_getRecipe_success() {
//        let recipeService = RecipeDataService()
//        let idMeal = "52961"
//
//        let expectation = self.expectation(description: "Retrieve non nil recipe")
//        var receivedRecipes: [Recipe]?
//
//        let cancellable = recipeService.getRecipe(idMeal: idMeal)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    break // Test successful completion
//                case .failure:
//                    XCTFail("Unexpected error")
//                }
//                expectation.fulfill()
//            }, receiveValue: { recipes in
//                receivedRecipes = recipes
//            })
//
//        waitForExpectations(timeout: 5, handler: nil)
//
//        XCTAssertNotNil(receivedRecipes)
//
//        cancellable.cancel()
//    }
//
//    func test_getRecipe_mealName_equalToBakewellTart() {
//        let recipeService = RecipeDataService()
//        let idMeal = "52767"
//
//        let expectation = self.expectation(description: "Get the correct recipe with the dessert name: Bakewell tart")
//
//        var receivedDessertNameOfRecipes: String?
//
//        let cancellable = recipeService.getRecipe(idMeal: idMeal)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    break // Test successful completion
//                case .failure:
//                    XCTFail("Unexpected error")
//                }
//                expectation.fulfill()
//            }, receiveValue: { recipes in
//                receivedDessertNameOfRecipes = recipes.first?.strMeal
//            })
//
//        waitForExpectations(timeout: 5, handler: nil)
//
//        XCTAssertEqual(receivedDessertNameOfRecipes, "Bakewell tart")
//
//        cancellable.cancel()
//    }
//
//    func test_getRecipe_ingredientsCount_equalToNine() {
//        let recipeService = RecipeDataService()
//        let idMeal = "52768"
//
//        let expectation = self.expectation(description: "Get the recipe with correct ingredient counts")
//
//        var count: Int?
//
//        let cancellable = recipeService.getRecipe(idMeal: idMeal)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    break // Test successful completion
//                case .failure:
//                    XCTFail("Unexpected error")
//                }
//                expectation.fulfill()
//            }, receiveValue: { recipes in
//                count = recipes.first?.getIngrediatnsAndMeasures().count
//            })
//
//        waitForExpectations(timeout: 5, handler: nil)
//
//        XCTAssertEqual(count, 9)
//
//        cancellable.cancel()
//    }
//
//    func test_getRecipe_fourthIngredient_equalToAlmonds_measurement_equalTo50g() {
//        let recipeService = RecipeDataService()
//        let idMeal = "52894"
//
//        let expectation = self.expectation(description: "Get the recipe with correct ingredient information")
//
//        var ingredient: String?
//        var measurement: String?
//
//        let cancellable = recipeService.getRecipe(idMeal: idMeal)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    break // Test successful completion
//                case .failure:
//                    XCTFail("Unexpected error")
//                }
//                expectation.fulfill()
//            }, receiveValue: { recipes in
//                ingredient = recipes.first?.strIngredient4
//                measurement = recipes.first?.strMeasure4
//            })
//
//        waitForExpectations(timeout: 5, handler: nil)
//
//        XCTAssertEqual(ingredient, "Almonds")
//        XCTAssertEqual(measurement, "50g")
//
//        cancellable.cancel()
//    }

    
}
