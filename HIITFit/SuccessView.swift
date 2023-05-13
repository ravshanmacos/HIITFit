
import SwiftUI

struct SuccessView: View {
    
    @Environment(\.dismiss) var dissmiss
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                Button("Continue", action: {
                    selectedTab = 9
                    dissmiss()
                })
            }
            
            VStack{
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundColor(Color("Launchscreen-background"))
                    .padding()
                Text("High Five !")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Text("""
                     Good job completing all four exercises!
                         Remember tomorrow's another day.
                          So eat well and get some rest
                    """)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.gray)
            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3))
    }
}
