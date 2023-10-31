//Created by Wennie

import SwiftUI

protocol MealViewFactory {
}

struct ContentView: View {
    let delegate: MealViewFactoryDelegate?
    var body: some View {
        if delegate != nil{
            delegate!.makeMealView()
        }

    }
}

#Preview {
    ContentView(delegate: nil)
}
