import SwiftUI
import SwiftData


@main struct Plants: App {
    var body: some Scene {
        WindowGroup {
            todaysReminder()
        }
        .modelContainer(for: [PlantsData.self])
    }
}
