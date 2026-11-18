import SwiftUI
import SwiftData


@main
struct Plants: App {
    @AppStorage("hasSeenSplash") private var hasSeenSplash = false
    init() {
            NotificationManager.shared.requestPermission()
        }

    var body: some Scene {
            WindowGroup {
                if hasSeenSplash {
                    homePage().preferredColorScheme(.dark)
                } else {
                    splashview ().preferredColorScheme(.dark)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                hasSeenSplash = true
                                
                            }
                        }
                }

        }
        .modelContainer(for: PlantsData.self)
    }
}
