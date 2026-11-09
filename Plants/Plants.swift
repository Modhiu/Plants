import SwiftUI
import SwiftData


@main struct Plants: App {
    var body: some Scene {
        WindowGroup {
            homePage()
        }
        .modelContainer(for: [PlantsData.self])
    }
}
