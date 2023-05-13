

import SwiftUI

struct HistoryView: View {
    
    @Binding var showHistory: Bool
    private let history = HistoryStore()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: {showHistory = false}) {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding(.all)
            
            VStack {
                Text("History")
                    .font(.title)
                    .padding()
                
                Form{
                    ForEach(history.exerciseDays) { day in
                        Section {
                            //section content
                            ForEach(day.exercises, id: \.self){ exercise in
                                Text(exercise)
                            }
                        } header: {
                            Text( day.date.formatted(as: "MMM d"))
                                .font(.headline)
                        }
                    }
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
            
    }
}
