//Created by Wennie

import SwiftUI

struct MealCellView: View {
    let meal: Meal
    var body: some View {

        HStack{
            AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case let .success(image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(8.0)
                        .frame(width: 100, height: 100)
                        .padding(10)
                case .failure:
                    Text("Failed to load image")
                @unknown default:
                    Text("Unknown state")
                }
            }
            Text(meal.strMeal)
            Spacer()
        }

    }
}

#Preview {
    let meal = Meal(id: "1", strMeal: "1", strMealThumb: "1", idMeal: "1")
    return MealCellView(meal: meal)
}
