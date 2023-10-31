//Created by Wennie

import SwiftUI

struct MealImageView: View {
    var mealImage: String
    let imageSize: CGFloat
    let cornerRadius: CGFloat
    let padding: CGFloat
    var body: some View{
        AsyncImage(url: URL(string: mealImage)) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFit()
                    .clipped()
                    .cornerRadius(cornerRadius)
                                       .frame(width: imageSize, height: imageSize)
                                       .padding(padding)
            } else if phase.error != nil {
                Color.gray
            } else {
                ProgressView()
            }
        }

    }

}

#Preview {
    MealImageView(mealImage: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", imageSize: 100, cornerRadius: 10, padding: 10)
}
