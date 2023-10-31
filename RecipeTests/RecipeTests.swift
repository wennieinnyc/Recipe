//Created by Wennie

import XCTest
@testable import Recipe

final class RecipeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

//    func test_fetch_53049_shouldHaveNameApamBalik() async {
//        let exp = expectation(description: "Check if meal id = 53049 has name Apam balik")
//        let service = RecipeDataService()
//
//        do {
//            if let result = service.getRecipe(idMeal: "53049").first() {
//                XCTAssertEqual(result.strMeal, "Apam balik")
//            } else {
//                XCTFail("No data received")
//            }
//        } catch {
//            XCTFail("Error: \(error.localizedDescription)")
//        }
//
//        exp.fulfill()
//        wait(for: [exp], timeout: 10)
//    }
//
//    var cancellables: Set<AnyCancellable> = []
//
//        func testGetDesserts() {
//            let expectation = XCTestExpectation(description: "Dessert meals fetched successfully")
//
//            // Create a mock data publisher that returns a MealsResponse
//            let mockDataPublisher = Result<MealsResponse, Error>.success(MockData.mealsResponse).publisher
//
//            // Create a mock data service that returns the mock data publisher
//            let mockDataService = MealDataService()
//            MealDataService.getData = { _ in
//                return mockDataPublisher.eraseToAnyPublisher()
//            }
//
//            mockDataService.getDesserts()
//                .sink(receiveCompletion: { completion in
//                    switch completion {
//                    case .finished:
//                        break // Test passed
//                    case .failure(let error):
//                        XCTFail("Fetching dessert meals failed with error: \(error)")
//                    }
//                    expectation.fulfill()
//                }, receiveValue: { meals in
//                    // Verify that the meals contain the expected data
//                    XCTAssertEqual(meals, MockData.mealsResponse.meals)
//                })
//                .store(in: &cancellables)
//
//            wait(for: [expectation], timeout: 5.0)
//        }
//
//    struct MockData {
//        static let mealsResponse: MealsResponse = {
//            // Create a mock MealsResponse with sample data
//            // You may need to modify this based on your actual data structure
//            let meal1 = Meal(id: "1", strMeal: "Dessert 1", strMealThumb: "", idMeal: "")
//            let meal2 = Meal(id: "2", strMeal: "Dessert 2", strMealThumb: "", idMeal: "")
//            return MealsResponse(meals: [meal1, meal2])
//        }()
//    }
}

