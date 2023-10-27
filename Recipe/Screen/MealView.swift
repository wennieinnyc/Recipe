//Created by Wennie

import SwiftUI

struct MealView: View {
    @ObservedObject var vm : MealViewModel

    var body: some View {
        ScrollView{
            VStack{
                ForEach(vm.meals){ meal in
                    MealCellView(meal:meal)
                }
            }
        }
    }
}

#Preview {
    MealView(vm: MealViewModel(dessertProvider: MealDataServie()))
}
