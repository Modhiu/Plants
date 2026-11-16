import SwiftUI
import SwiftData


@main struct Plants: App {
    init() {
            NotificationManager.shared.requestPermission()
        }

    var body: some Scene {
            WindowGroup {
                NavigationStack{
                homePage()
            }
        }
        .modelContainer(for: PlantsData.self)
    }
}
