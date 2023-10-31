//Created by Wennie

import SwiftUI

struct MealCellView: View {
    let meal: Meal
    var body: some View {

        HStack{
            MealImageView(mealImage: meal.strMealThumb, imageSize: 100, cornerRadius: 8, padding: 10)
            Text(meal.strMeal)
            Spacer()
        }

    }
}

#Preview {
    let meal = Meal(id: "1", strMeal: "1", strMealThumb: "1", idMeal: "1")
    return MealCellView(meal: meal)
}
