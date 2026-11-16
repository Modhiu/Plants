import SwiftUI
import SwiftData


struct EmptyView: View {
    var body: some View {
        VStack {
            Text("My Plants 🌱")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 34, weight: .bold))
                .padding(24)
            
            Divider().background(Color.dcolor).padding(10)
            
            Spacer().frame(height: 73)
            
            
            Text("No reminders set yet.. ")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 25, weight: .semibold))
                .padding()

                       }    }
}
#Preview {
EmptyView()
}
