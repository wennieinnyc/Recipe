//Created by Wennie

struct ContentViewFactory : ContentViewMaker {

    func makeMealView() -> MealView {
        MealView(vm: makeMealViewModel(), factory: MealViewFactory())
    }

    private func makeMealViewModel() -> MealViewModel {
        MealViewModel(dessertProvider: makeDessertProvider())
    }

    private func makeDessertProvider() -> DessertProvider {
        MealDataService(HttpsService: URLSessionHttpsService())
    }
}
