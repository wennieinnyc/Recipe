//Created by Wennie

import SwiftUI

protocol ContentViewFactory {
    func makeMealView() -> MealView
}

struct ContentView: View {
    let factory: ContentViewFactory?
    var body: some View {
        if factory != nil{
            factory!.makeMealView()
        }
    }
}

#Preview {
    ContentView(factory: nil)
}
