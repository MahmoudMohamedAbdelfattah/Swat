//
//  RecordVedio.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/24/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import AVKit
import MobileCoreServices
class RecordVedio: UIViewController ,UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    var VideoAndImageReview = UIImagePickerController()
    var videoURL : URL?
    // Record Video
    @IBAction func RecAct(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            print("Camera Available")
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            print("Camera UnAvailbale")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let mediaType = info[UIImagePickerController.InfoKey.mediaURL] as? String , mediaType == (kUTTypeMovie as String),
        let url = info[UIImagePickerController.InfoKey.mediaURL] as? URL,
            UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url.path)
            else {
                return
        }
             UISaveVideoAtPathToSavedPhotosAlbum(
                url.path,
                self,
                #selector(video(_:didFinishSavingWithError:contextInfo:)),
                nil)
        }
        
        @objc func video(_ videoPath: String, didFinishSavingWithError error: Error?, contextInfo info: AnyObject) {
            let title = (error == nil) ? "Success" : "Error"
            let message = (error == nil) ? "Video was saved" : "Video failed to save"
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    
    // playing Video
     
     @IBAction func playAct(_ sender: UIButton) {
         VideoAndImageReview.sourceType = .savedPhotosAlbum
         VideoAndImageReview.delegate = self
         VideoAndImageReview.mediaTypes = ["public.movie"]
         present(VideoAndImageReview, animated: true, completion: nil)
     }
     
     func videoAndImageReview(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        videoURL = info[UIImagePickerController.InfoKey.mediaURL.rawValue] as? URL
         print("\(String(describing: videoURL))")
         self.dismiss(animated: true, completion: nil)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
