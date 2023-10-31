//Created by Wennie

import SwiftUI

protocol MealViewDelegate {
    func makeMealView() -> MealView
}

struct ContentView: View {
    let delegate: MealViewDelegate?
    var body: some View {
        if delegate != nil{
            delegate!.makeMealView()
        }

    }
}

#Preview {
    ContentView(delegate: nil)
}
