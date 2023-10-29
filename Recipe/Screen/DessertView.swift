//Created by Wennie

import SwiftUI

struct DessertView: View {
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
//                        MealCellView(meal:meal)
                    }
                }
            }
        }

    }
}

#Preview {
    DessertView(vm: MealViewModel(dessertProvider: MealDataService()))
}
