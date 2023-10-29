//Created by Wennie

import SwiftUI

struct RecipeView: View {

    let id: String
    @ObservedObject var vm : RecipeViewModel

    var body: some View {
            VStack {
                Text(id)
                Text(vm.recipe?.strArea ?? "")
                .onAppear {
                    vm.getRecipe(idMeal: id)
                }
            }
        }
}

#Preview {
    RecipeView(id: "1", vm: RecipeViewModel())
}
