//Created by Wennie

import SwiftUI

struct InstructionsView: View {
    let instructions: [String]
    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.primary)
                .font(.system(size: 20))
                .bold()
            ForEach(Array(instructions.enumerated()), id: \.offset) { index, instruction in

                Text("Step \(index + 1)").underline().padding(.vertical, 5)
                Text(instruction)

            }
        }
    }
}

#Preview {
    InstructionsView(instructions:[""], title: "Instructions")
}
