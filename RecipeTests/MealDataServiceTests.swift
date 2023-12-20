//Created by Wennie

import XCTest
@testable import Recipe
import OHHTTPStubsSwift
import OHHTTPStubs
import Combine

final class MealDataServiceTests: XCTestCase {

    func testMealUrl() {
        stub(condition: isHost("mywebservice.com")) { _ in
          // Stub it with our "wsresponse.json" stub file (which is in same bundle as self)
          let stubPath = OHPathForFile("wsresponse.json", type(of: self))
          return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
        }
    }

    func testGetMealsGetCorrectResult() {
        // Swift
        // Here we use the anonymous parameter '_' in the second closure (as its NSURLRequest parameter is unused in our code)
        let meals = [
          Meal(id: "1", strMeal: "Chocolate Cake", strMealThumb: "", idMeal: "123"),
          Meal(id: "2", strMeal: "Carot Cake", strMealThumb: "", idMeal: "111111")
        ]
        stub(condition: isHost("themealdb.com")) { _ in
            return HTTPStubsResponse(
                fileAtPath: OHPathForFile("MealsJsonResponse.json", type(of: self))!,
                statusCode: 200,
                headers: ["Content-Type":"application/json"]
              )
        }

        let sut = MealDataService(HttpsService: URLSessionHttpsService())
        let spy = DessertProviderTester(dessertProvider: sut)
        spy.loadMeals()
        print(spy.meals)
        print(meals)
        XCTAssertEqual(spy.meals, meals)
    }

    override func tearDown() {
        HTTPStubs.removeAllStubs()
    }
}

class DessertProviderTester {
    @Published var meals: [Meal] = []

    var cancellables = Set<AnyCancellable>()
    let dessertProvider: DessertProvider

    init(dessertProvider: DessertProvider) {
        self.dessertProvider = dessertProvider
    }
    
    func loadMeals() {
        dessertProvider.getMeals()
            .sink (receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    print("Error: \(error)")
                }
            },receiveValue: { [weak self] returnedMeals in
                self?.meals = returnedMeals
                print(self?.meals)
            })
            .store(in: &cancellables)
    }
}
