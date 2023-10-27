//Created by Wennie

import SwiftUI

struct MealView: View {
    @StateObject private var vm = MealViewModel()

    var body: some View {
        ScrollView{
            VStack{
                ForEach(vm.meals){ meal in
                    Text(meal.strMeal)
                }
            }
        }
    }
}

#Preview {
    MealView()
}
