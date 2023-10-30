//Created by Wennie

import SwiftUI

struct MealCellView: View {
    let meal: Meal
    let imageSize: CGFloat = 100
    let cornerRadius: CGFloat = 8.0
    let padding: CGFloat = 10


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
                        .cornerRadius(cornerRadius)
                        .frame(width: imageSize, height: imageSize)
                        .padding(padding)
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
