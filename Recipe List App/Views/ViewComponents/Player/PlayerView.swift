//
//  PlayerView.swift
//  Recipe List App
//
//  Created by Robert Thomas on 9/17/21.
//

import SwiftUI
import AVKit

class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        let url = Bundle.main.url(forResource: "loginPage", withExtension: "mp4")!
        let url = URL(string: "https://pebble-public.s3.amazonaws.com/loginPage4_1.mp4")!
        let player = AVPlayer(url: url)
        player.actionAtItemEnd = .none
        player.play()
        
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem)

        layer.addSublayer(playerLayer)
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: .zero, completionHandler: nil)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
            .colorMultiply(.gray)
//        VideoPlayer(player: AVPlayer(url: URL(string: "https://pebble-public.s3.amazonaws.com/loginPage7.mp4")!))
//            .frame(height: 400)
    }
}
