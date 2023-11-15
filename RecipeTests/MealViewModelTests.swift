//Created by Wennie

import XCTest
@testable import Recipe
import Combine

final class MealViewModelTests: XCTestCase {

    typealias MockDessertProviderResult = Result<[Meal], Error>

    enum TestError: Error {
        case unknown
    }

    struct MockDessertProvider: DessertProvider {
        let result: MockDessertProviderResult
        func getMeals() -> AnyPublisher<[Meal], Error> {
            switch result{
                case.success(let meals):
                    return Just(meals)
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                case.failure(let error):
                    return Fail<[Meal], Error>(error: error)
                        .eraseToAnyPublisher()
            }
        }
    }

    func test_init_setsMealsToEmpty_whenProviderErrors() {
        let sut = MealViewModel(dessertProvider: MockDessertProvider(result: .failure(TestError.unknown)))
        XCTAssert(sut.meals == [])
    }

    func test_init_setsMealsToProviderGetMeals_sortedByStrMealAlphabetically() {
        let sut = MealViewModel(dessertProvider: MockDessertProvider(result: .success([
            Meal(id: "1", strMeal: "Chocolate Cake", strMealThumb: "", idMeal: "123"),
            Meal(id: "2", strMeal: "Carot Cake", strMealThumb: "", idMeal: "111111")
        ])))
        XCTAssert(sut.meals == [
            Meal(id: "2", strMeal: "Carot Cake", strMealThumb: "", idMeal: "111111"),
            Meal(id: "1", strMeal: "Chocolate Cake", strMealThumb: "", idMeal: "123")
        ])
    }

}
