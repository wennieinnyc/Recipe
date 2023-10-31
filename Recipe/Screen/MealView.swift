//Created by Wennie

import SwiftUI
import Combine

protocol MealViewFactory {
    func makeRecipeView(idMeal: String) -> AnyView
}

struct MealView: View {
    @ObservedObject var vm : MealViewModel
    
    let factory: MealViewFactory
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    ForEach(vm.meals){ meal in
                        NavigationLink {
                            factory.makeRecipeView(idMeal: meal.idMeal)
                        } label: {
                            MealCellView(meal:meal)
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

struct PreviewDessertProvider : DessertProvider {
    func getDesserts() -> AnyPublisher<[Meal], Error> {
        Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}

struct PreviceMealViewFactory: MealViewFactory {
    func makeRecipeView(idMeal: String) -> AnyView {
        AnyView.init(erasing: Text("a"))
    }
}
