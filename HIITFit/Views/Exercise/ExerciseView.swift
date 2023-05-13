

import SwiftUI
import AVKit

struct ExerciseView: View {
    
    @State private var timerDone = false
    @State private var showTimer = false
    
    @State private var showSuccess = false
    @State private var showHistory = false
    @State private var rating = 0
    @Binding var selectedTab: Int
    
    let index: Int
    var exercise: Exercise{
        Exercise.exercises[index]
    }
    

    var lastExercise: Bool{
        index + 1 == Exercise.exercises.count
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0){
                HeaderView(selectedTab: $selectedTab, titleHeader: exercise.exerciseName)
                    .padding(.bottom)
                
                //Video Player
                VideoPlayerView(deviceHeight: geometry.size.height, videoName: exercise.videoName)
                
              

                //controll stack
                HStack(spacing: 150){
                    startButton
                    doneButton
                        .disabled(!timerDone)
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium, .large])
                        }
                }
                .font(.title3)
                .padding()
                
                //TimerView
                if showTimer {
                  TimerView(
                    timerDone: $timerDone,
                    size: geometry.size.height * 0.07
                  )
                }
                
                Spacer()
                RatingView(rating: $rating)
                    .padding()
                
                
                
                Button("History"){ showHistory.toggle()}
                    .sheet(isPresented: $showHistory, content: {
                        HistoryView(showHistory: $showHistory)
                    })
                    .padding(.bottom)
            }
        }
    }
    
    var startButton: some View{
        Button("Start Exercise"){
            showTimer.toggle()
        }
    }
    
    var doneButton: some View{
        Button("Done"){
            timerDone = false
            showTimer.toggle()
            
            if lastExercise{
                showSuccess.toggle()
            }else{
                selectedTab += 1
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(3), index: 3)
    }
}

