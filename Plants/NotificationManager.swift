import UserNotifications

final class NotificationManager{
    static let shared = NotificationManager()
    private init() {}
    
    
    
    func requestPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
    }
    private func intervalDays(from days: String) -> Int {
            switch days {
            case "Every day":     return 1
            case "Every 2 days":  return 2
            case "Every 3 days":  return 3
            case "Once a week":   return 7
            case "Every 10 days": return 10
            case "Every 2 weeks": return 14
            default:              return 1
            }
        }
    func schedule(id: String, days: String) {
        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.body = "Hey! let's water your plant"
        content.sound = .default

        let seconds = TimeInterval(intervalDays(from: days) * 24 * 60 * 60)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: true)
        
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    func cancel(id: String) {
            UNUserNotificationCenter.current()
                .removePendingNotificationRequests(withIdentifiers: [id])
        }

    
}
