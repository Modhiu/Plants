import Foundation
import Combine
import SwiftData


class todaysReminderMV : ObservableObject{
    @Published var reminders : Int = 0 //متغير لتحديد عدد التذكيرات الموجوده
    
}
