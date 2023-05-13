
import SwiftUI

struct HeaderView: View {
    
    @Binding var selectedTab: Int
    let titleHeader: String
    
    var body: some View {
        VStack {
            Text(titleHeader)
                .font(.largeTitle)
            HStack{
                ForEach(0..<4){ index in
                    let fill = index == selectedTab ? ".fill" : ""
                    Image(systemName: "\(index+1).circle\(fill)")
                        .onTapGesture {
                            selectedTab = index
                        }
                }
                .font(.title2)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(selectedTab: .constant(0), titleHeader: "Squat")
            .previewLayout(.sizeThatFits)
    }
}
