import SwiftUI
import SwiftData

struct EmptyView: View {
    @StateObject var viewModel = PlantVM()
    var body: some View {
        VStack {
            Text("My Plants 🌱")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 34, weight: .bold))
                .padding(24)

            Divider().background(Color.dcolor).padding(10)

            Spacer()

            Text("No reminders set yet..")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.reminders)
                .padding()

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background.ignoresSafeArea())
        
        Button{
            viewModel.showForm = true
            
        }label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 44, height: 44)
            
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.circle)
        .tint(.buttonscolor)
        .sheet(isPresented: $viewModel.showForm) {
            NewReminder(viewModel: viewModel)
        }.frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal, 24 )
    }
}

#Preview {
    EmptyView()
}
