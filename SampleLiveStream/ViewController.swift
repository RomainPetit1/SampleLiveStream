//
//  ViewController.swift
//  SampleLiveStream
//
//  Created by Romain Petit on 21/10/2021.
//

import UIKit
import LiveStreamIos

class ViewController: UIViewController {

    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var startStopBtn: UIButton!
    
        private var apiVideo: ApiVideoLiveStream?
        private var isStreaming: Bool = false
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            startStopBtn.setTitle("Start", for: .normal)
            apiVideo = ApiVideoLiveStream(view: cameraView)
        }

        @IBAction func StartStopLive(_ sender: Any) {
            if(!isStreaming){
                apiVideo!.startLiveStreamFlux(liveStreamKey: "d08c582e-e251-4f9e-9894-8c8d69755d45", rtmpServerUrl: nil)
                startStopBtn.setTitle("Stop", for: .normal)
                isStreaming = true
            }else{
                apiVideo!.stopLiveStreamFlux()
                isStreaming = false
                startStopBtn.setTitle("Start", for: .normal)
            }
            
        }
    @IBAction func switchCamera(_ sender: Any) {
        if(apiVideo?.videoCamera == .back){
            apiVideo?.videoCamera = .front
        }else{
            apiVideo?.videoCamera = .back
        }
        
    }
    


}

