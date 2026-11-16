import SwiftUI
import Playgrounds
import SwiftData

struct homePage: View {
    @StateObject private var viewModel = PlantVM()
    @Environment(\.modelContext) private var context
    @Query private var plants: [PlantsData]
    
    
    var body: some View {
        NavigationStack{
            Group{
                switch viewModel.state(for: plants){
                case .empty:
                    todaysReminder()
                case .allDone:
                    todaysReminder()
                case .list:
                    todaysReminder()
                }
            }.background(Color.background.ignoresSafeArea())
                .sheet(isPresented: $viewModel.showForm){
                    NewReminder(viewModel: viewModel)
                }
        }
    }
}

#Preview {
    homePage()
}

#Playground {
    _ = 1 + 2
}
