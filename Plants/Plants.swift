import SwiftUI
import SwiftData

@main
struct Plants: App {
    init() {
        NotificationManager.shared.requestPermission()
    }

    var body: some Scene {
        WindowGroup {
            homePage()
                .preferredColorScheme(.dark)
        }
        .modelContainer(for: PlantsData.self)
    }
}
