//Created by Wennie

import SwiftUI
import Combine

protocol MealViewFactoryDelegate {
    func makeRecipeView(idMeal: String) -> AnyView
}

struct MealView: View {
    @ObservedObject var vm : MealViewModel
    
    let factory: MealViewFactoryDelegate
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

struct MealImage: View{
    var mealImage: String
    var body: some View{
        AsyncImage(url: URL(string: mealImage)) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFit()
                    .clipped()
                    .cornerRadius(5)
            } else if phase.error != nil {
                Color.gray
            } else {
                ProgressView()
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

struct PreviceMealViewFactory: PreviceMealViewFactory {
    func makeRecipeView(idMeal: String) -> AnyView {
        AnyView.init(erasing: Text("a"))
    }
}
