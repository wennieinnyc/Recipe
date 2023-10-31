//Created by Wennie

import SwiftUI

struct MealView: View {
    @ObservedObject var vm : MealViewModel

    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    ForEach(vm.meals){ meal in
                        NavigationLink {
                            RecipeView(id:meal.idMeal, vm: RecipeViewModel())
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
    MealView(vm: MealViewModel(dessertProvider: MealDataService()))
}
