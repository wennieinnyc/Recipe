// Created by Wennie

import SwiftUI

struct IngredientsAndMeasuresTableView: View {
    let title: String
    let ingredientsAndMeasures: [(String, String)]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.primary)
                .font(.system(size: 20))
                .bold()
            ForEach(ingredientsAndMeasures, id: \.0) { key, value in
                TableRowView(name: key, value: value).padding(.vertical, 2)
            }
        }
    }
}

struct TableRow: Identifiable {
    var id = UUID()
    let name: String
    let value: String
}

struct TableRowView: View {
    let name: String
    let value: String

    var body: some View {
        HStack {
            Text(value)
            Text(name.capitalized)
            Spacer()
        }
    }
}

// #Preview {
//    IngredientsAndMeasuresTableView(ingredientsAndMeasures: [(:)])
// }
