
import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    let deviceHeight: CGFloat
    let videoName: String
    
    var body: some View {
        if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
            VideoPlayer(player: AVPlayer(url: url))
                .frame(height: deviceHeight * 0.45)
        } else {
            Text("Couldn't find \(videoName).mp4")
                .foregroundColor(.red)
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(deviceHeight: 1200, videoName: "burpee")
            .previewLayout(.sizeThatFits)
    }
}
