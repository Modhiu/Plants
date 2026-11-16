import SwiftUI
import SwiftData
import Combine


struct homePage: View {
    @StateObject private var viewModel = PlantVM()
    @Environment(\.modelContext) private var context
    @Query private var plants: [PlantsData]
    
    
    var body: some View {
        NavigationStack{
            Group{
                switch viewModel.state(for: plants){
                case .empty:
                    EmptyView()
                case .allDone:
                    AllDoneView(viewModel: viewModel)
                case .list:
                    todaysReminder(viewModel: viewModel)
                }
            }.background(Color.background.ignoresSafeArea())
                        .sheet(isPresented: $viewModel.showForm) {
                            NewReminder(viewModel: viewModel)
                                .presentationBackground(Color.background)
                        }
            
        }
    }
    }

#Preview {
    homePage()
}


