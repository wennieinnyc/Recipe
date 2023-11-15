// Created by Wennie

import SwiftUI

protocol ContentViewMaker {
    func makeMealView() -> MealView
}

struct ContentView: View {
    let factory: ContentViewMaker?
    var body: some View {
        if factory != nil {
            factory!.makeMealView()
        }
    }
}

#Preview {
    ContentView(factory: nil)
}
