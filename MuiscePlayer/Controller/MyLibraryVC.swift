//
//  MyLibraryVC.swift
//  MuiscePlayer
//
//  Created by Mostafa on 11/23/18.
//  Copyright © 2018 Mostafa. All rights reserved.
//

import UIKit
import AVFoundation

class MyLibraryVC: BaseViewController {

    @IBOutlet weak var audioLength: UILabel!
    @IBOutlet weak var playingTime: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var albumImage: UIImageView!
    
    
    var audioPlayer: AVAudioPlayer?
    var playingFlag = false
    var fileDuration: Double!
    var timer:Timer!
    var urlPath: String!
    var songName: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        songName = "Møme - Aloha (Official Music Video) ft. Merryn Jeann"
        getAudioFile()
        
    }
    @IBAction func nextSongClicked(_ sender: UIButton) {
        songName = "Beggin  - Madcon (Step up 3D)(original Motion Picture Soundtrack)"
        albumImage.image = UIImage(named: "images")
        getAudioFile()
        playerDefault()
    }
    @IBAction func backSongClicked(_ sender: UIButton) {
        songName = "Møme - Aloha (Official Music Video) ft. Merryn Jeann"
        albumImage.image = UIImage(named: "Armin_Van_Buuren_-_Intense")
        getAudioFile()
        playerDefault()
    }
    @IBAction func forwardClicked(_ sender: UIButton) {
        var time: TimeInterval = (audioPlayer?.currentTime)!
        time += 15.0
        if time > audioPlayer!.duration
        {
            audioPlayer?.stop()
            timer.invalidate()
            playBtn.setImage(UIImage(named: "play-button"), for: .normal)
        }
        else
        {
            audioPlayer?.currentTime = time
            fileDuration = fileDuration - 15.0
        }
    }
    @IBAction func backwardClicked(_ sender: UIButton) {
        var time: TimeInterval = (audioPlayer?.currentTime)!
        time -= 15.0
        if time < 0
        {
            audioPlayer?.stop()
            timer.invalidate()
            playBtn.setImage(UIImage(named: "play-button"), for: .normal)
        }
        else
        {
            audioPlayer?.currentTime = time
            fileDuration = fileDuration + 15.0
        }
    }
    @IBAction func playClicked(_ sender: UIButton) {
        
        if !audioPlayer!.isPlaying{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(MyLibraryVC.getPlayingTime), userInfo: nil, repeats: true)
            audioPlayer?.play()
            playBtn.setImage(UIImage(named: "pause (5)"), for: .normal)
            timer.fire()
        }else{
            timer.invalidate()
            playBtn.setImage(UIImage(named: "play-button"), for: .normal)
            audioPlayer?.pause()
        }
    }
}
extension MyLibraryVC{
    
    func getAudioFile(){
        let path = Bundle.main.path(forResource: songName, ofType: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
        urlPath = path
        fileDuration = durations(for: path!)
        audioLength.text = getFormattedTime(count: fileDuration)
    }
    func runProgressView(){
        let progress = audioPlayer!.currentTime / audioPlayer!.duration
        progressBar.setProgress(Float(progress), animated: true)
    }
    func durations(for resource: String) -> Double {
        let asset = AVURLAsset(url: URL(fileURLWithPath: resource))
        return Double(CMTimeGetSeconds(asset.duration))
    }
    @objc func getPlayingTime() {
        playingTime.text = getFormattedTime(count: audioPlayer!.currentTime)
        runProgressView()
        getRemainingTime()
    }
    func getRemainingTime(){
        fileDuration -=  1
        audioLength.text = getFormattedTime(count: fileDuration)
        if audioLength.text == "00:00"{
            playerDefault()
        }
    }
    func playerDefault(){
        if timer != nil{
            timer.invalidate()
            audioPlayer!.stop()
            audioPlayer?.currentTime = 0
            progressBar.progress = 0
            fileDuration = durations(for: urlPath)
            playBtn.setImage(UIImage(named: "play-button"), for: .normal)
        }
    }
}
