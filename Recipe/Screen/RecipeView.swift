//Created by Wennie

import SwiftUI

struct RecipeView: View {

    let id: String
    @ObservedObject var vm : RecipeViewModel

    var body: some View {
            VStack {
                Text(id)
                Text(vm.recipe?.strArea ?? "")
                createTableView(ingredientsAndMeasures: vm.recipe?.getIngrediatnsAndMeasures() ?? [("","")])
                .onAppear {
                    vm.getRecipe(idMeal: id)
                }
            }
        }
    func createTableView(ingredientsAndMeasures: [(String, String)]) -> some View {
           let rows = ingredientsAndMeasures.map { key, value in TableRow(name: key, value: value) }
           return Table(rows: rows) { row in
               HStack {
                   Text(row.name)
                   Text(row.value)
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
/**
    Represents a single row in a table view. It conforms to the Identifiable protocol, which means that it has a unique identifier property called id. The id property is initialized to a new UUID value by default.
 */
struct TableRow: Identifiable {
    var id = UUID()
    let name: String
    let value: String
}
/**
    View that constructs and displays generic conten based on TableRow object provided
 */
struct Table<Content: View>: View {
    let rows: [TableRow]
    let content: (TableRow) -> Content

    var body: some View {
        VStack(alignment: .leading){
            ForEach(rows) { row in
                content(row)
                    .font(.caption.weight(.light))
            }
        }
    }
}
#Preview {
    RecipeView(id: "1", vm: RecipeViewModel())
}
