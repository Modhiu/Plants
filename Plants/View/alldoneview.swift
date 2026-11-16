import SwiftUI

struct AllDoneView: View {
    @ObservedObject var viewModel: PlantVM

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                Text("My Plants 🌱")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 34, weight: .bold))
                    .padding(24)

                Divider().background(Color.dcolor)

                Spacer()

                Image(.happyplant)
                    .padding()

                Text("All Done! 🎉")
                    .font(.system(size: 25, weight: .semibold))

                Text("All Reminders Completed")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.reminders)
                    .padding(.top, 4)

                Spacer()
            }

            Button {
                viewModel.Adding()
            } label: {
                Image(systemName: "plus")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(width: 44, height: 44)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.circle)
            .tint(.buttonscolor)
            .padding(.trailing, 24)
            .padding(.bottom, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background.ignoresSafeArea())
    }
}

#Preview {
    AllDoneView(viewModel: PlantVM())
}
