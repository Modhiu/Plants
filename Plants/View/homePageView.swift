import SwiftUI
import SwiftData
import Combine


struct homePage: View {
    @StateObject private var viewModel = PlantVM()
    @Environment(\.modelContext) private var context
    @Query private var plants: [PlantsData]
    @AppStorage("hasSeenSplash") private var hasSeenSplash = false
    
    
    var body: some View {
        NavigationStack{
            Group {
                          if !hasSeenSplash {
                              splashview(viewModel: viewModel)
                          } else {
                              switch viewModel.state(for: plants) {
                              case .empty:   Emptypage(viewModel: viewModel)
                              case .allDone: AllDoneView(viewModel: viewModel)
                              case .list:    todaysReminder(viewModel: viewModel)
                              }
                          }
                      }
            .background(Color.background.ignoresSafeArea())
        }
                        .sheet(isPresented: $viewModel.showForm) {
                            NewReminder(viewModel: viewModel)
                                .presentationBackground(Color.background)
                        }
            
    }
    }

#Preview {
    homePage()
        .modelContainer(for: PlantsData.self, inMemory: true)
        .preferredColorScheme(.dark)
}

