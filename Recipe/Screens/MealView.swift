// Created by Wennie

import Combine
import SwiftUI

protocol MealViewMaker {
    func makeRecipeView(idMeal: String) -> AnyView
}

struct MealView: View {
    @ObservedObject var vm: MealViewModel

    let factory: MealViewMaker
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(vm.meals) { meal in
                        NavigationLink {
                            factory.makeRecipeView(idMeal: meal.idMeal)
                        } label: {
                            MealCellView(meal: meal)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MealView(vm: MealViewModel(dessertProvider: PreviewDessertProvider()), factory: PreviceMealViewFactory())
}

struct PreviewDessertProvider: DessertProvider {
    func getMeals() -> AnyPublisher<[Meal], Error> {
        Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}

struct PreviceMealViewFactory: MealViewMaker {
    func makeRecipeView(idMeal _: String) -> AnyView {
        AnyView(erasing: Text("a"))
    }
}
