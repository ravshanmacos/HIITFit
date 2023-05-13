

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 9
    
  var body: some View {
      TabView(selection: $selectedTab) {
          WelcomeView(selectedTab: $selectedTab)
              .tag(9)
          ForEach(Exercise.exercises.indices, id: \.self) {
              ExerciseView(selectedTab: $selectedTab ,index: $0)
                  .tag($0)
          }
      }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

//TabView{
//    WelcomeView()
//    ForEach(Exercise.exercises.indices, id: \.self){
//        ExerciseView(index: $0)
//    }
//    Text("Exercise 2")
//}
//.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
