import SwiftUI
import SwiftData


@main struct Plants: App {
    var body: some Scene {
            WindowGroup {
                NavigationStack{
                homePage()
            }
        }
        .modelContainer(for: [PlantsData.self])
    }
}
