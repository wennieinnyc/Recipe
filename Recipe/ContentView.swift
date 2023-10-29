//Created by Wennie

import SwiftUI

protocol MealViewDelegate {
    func makeDessertView() -> DessertView
}

struct ContentView: View {
    let delegate: MealViewDelegate?
    var body: some View {
        if delegate != nil{
            delegate!.makeDessertView()
        }

    }
}

#Preview {
    ContentView(delegate: nil)
}
