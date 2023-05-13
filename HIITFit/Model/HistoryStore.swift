
import Foundation

struct ExerciseDay: Identifiable{
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

struct HistoryStore{
    var exerciseDays: [ExerciseDay] = []
    
    init() {
        #if DEBUG
        createDeveData()
        #endif
    }
}


