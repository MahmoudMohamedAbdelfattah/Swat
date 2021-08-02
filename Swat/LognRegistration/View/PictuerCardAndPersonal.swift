//
//  PictuerCardAndPersonal.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/23/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class PictuerCardAndPersonal: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    @IBOutlet var image: [UIImageView]!
    
    @IBOutlet weak var IMGSwat: UIImageView!
    @IBOutlet weak var MainView: circle!
    @IBOutlet weak var LblCardPersonal: UILabel!
    
    @IBOutlet weak var PresonlIMG: UIImageView!
    @IBOutlet weak var ButtNext: UIButton!
    @IBOutlet weak var CardIMG: UIImageView!
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup image
        IMGSwat.CornerRadiusBorderNum(Radius: 15, BorderWidth: 1, color: .white)
        self.imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        MainView.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .white)
          ButtNext.CornerRadiusBorderNum(Radius: 20, BorderWidth: 1, color: .white)
        CardIMG.CornerRadiusBorderNum(Radius: 20, BorderWidth: 1, color: .white)
        // phone
     //   imagePicker.sourceType = .camera
      //  imagePicker.allowsEditing = true
        // to do acition
        //let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(PictuerCardAndPersonal.ChooseImage))
    //    CardIMG.addGestureRecognizer(tapGestureRecognizer)
        // لكي الصوره تعمل
       // CardIMG.isUserInteractionEnabled = true
               imagePicker.delegate = self
               imagePicker.sourceType = .savedPhotosAlbum
              imagePicker.sourceType = .photoLibrary

           //     imagePicker.sourceType = .camera
               imagePicker.allowsEditing = false
        
        [PresonlIMG,CardIMG].forEach {
             $0?.isUserInteractionEnabled = true
             $0?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(chooseImage)))
               }
    }
    var selectedVew: UIView!

    @objc func chooseImage(_ gesture: UITapGestureRecognizer) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            selectedVew = gesture.view
            let alertcon=UIAlertController(title: "اختر الصوره", message: "من اي مصدر تريد احضار الصوره", preferredStyle: .actionSheet)
            let camera=UIAlertAction(title: "الكاميرا", style:.default) {[weak self] (ـ) in
                self?.imagePicker.sourceType = .camera
                if self != nil{
                    self?.present(self!.imagePicker,animated: true,completion: nil)
                }}

            let photo=UIAlertAction(title: "الصور", style:.default) {[weak self] (ـ) in
                self?.imagePicker.sourceType = .photoLibrary
                if self != nil{
                    self?.present(self!.imagePicker,animated: true,completion: nil)
                }}
            let cancel=UIAlertAction(title: "الغاء", style: .cancel, handler: nil)

            alertcon.addAction(cancel)
            alertcon.addAction(camera)
            alertcon.addAction(photo)
            present(alertcon,animated: true,completion: nil)

            present(imagePicker, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        (selectedVew as? UIImageView)?.image = info[.originalImage] as? UIImage
    //    PresonlIMG.image = selectedVew as! UIImageView
     //   let  images = (info[UIImagePickerController.InfoKey.editedImage] as! UIImage)
                dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    ////////////// MY///
    
//    @objc func chooseImage(img : UIImageView)
//         {
//             let alertcon=UIAlertController(title: "اختر الصوره", message: "من اي مصدر تريد احضار الصوره", preferredStyle: .actionSheet)
//             let camera=UIAlertAction(title: "الكاميرا", style:.default) {[weak self] (ـ) in
//                 self?.imagePicker.sourceType = .camera
//                 if self != nil{
//                     self?.present(self!.imagePicker,animated: true,completion: nil)
//                 }}
//
//             let photo=UIAlertAction(title: "الصور", style:.default) {[weak self] (ـ) in
//                 self?.imagePicker.sourceType = .photoLibrary
//                 if self != nil{
//                     self?.present(self!.imagePicker,animated: true,completion: nil)
//                 }}
//             let cancel=UIAlertAction(title: "الغاء", style: .cancel, handler: nil)
//
//             alertcon.addAction(cancel)
//             alertcon.addAction(camera)
//             alertcon.addAction(photo)
//             present(alertcon,animated: true,completion: nil)
//
//         }

//     choose image
//
//           func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
//           {
//               let TheImg = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
//              CardIMG.image = TheImg
//             PresonlIMG.image = TheImg
//
//               ImagBack.backgroundColor = .white
//                 LblCardPersonal.isHidden = true
//
//            ButtNext.backgroundColor = .blue
//            ButtNext.setTitleColor(.red, for: .normal)
//               dismiss(animated: true, completion: nil)
//
//           }
//
//           func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
//
//               dismiss(animated: true, completion: nil)
//           }
//
//
//
//
//}
//////////////////////////////////


//extension EditStoreVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    func chooseimage(imagePiker: UIImagePickerController ) {
//
//        let alertcon=UIAlertController(title: "".localized(), message: "Choose".localized(), preferredStyle: .actionSheet)
//        let camera = UIAlertAction(title: "Camera".localized(), style: .default) {[weak self] (_) in
//            imagePiker.sourceType = .camera
//            imagePiker.delegate = self
//            imagePiker.allowsEditing = true
//            imagePiker.mediaTypes = ["public.image"]
//
//            if self?.imagePikerLogo == imagePiker {
//                self?.present(self!.imagePikerLogo, animated: true, completion: nil)
//            } else {
//                 self?.present(self!.imagePikerCover, animated: true, completion: nil)
//            }
//
//        }
//
//        if let popoverController = alertcon.popoverPresentationController {
//            popoverController.sourceView = self.view
//            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.maxY, width: 0, height: 0)
//            popoverController.permittedArrowDirections = []
//        }
//
//        let photo = UIAlertAction(title: "Gallery".localized(), style: .default) {[weak self] (_) in
//            imagePiker.delegate=self
//            imagePiker.sourceType = .photoLibrary
//            imagePiker.allowsEditing=true
//
//
//                self?.present(imagePiker, animated: true, completion: nil)
//
//        }
//
//        let cancel=UIAlertAction(title: "Cancel".localized(), style: .cancel, handler: nil)
//
//        alertcon.addAction(cancel)
//        alertcon.addAction(camera)
//        alertcon.addAction(photo)
//        present(alertcon, animated: true, completion: nil)
//
//    }
//
//    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//        let  images = (info[UIImagePickerController.InfoKey.editedImage] as! UIImage)
//
//        if picker == imagePikerLogo {
//            self.storeLogoImageView.image = images
//        } else {
//            self.coverImageView.image = images
//        }
//
//        dismiss(animated: true, completion: nil)
//    }
//
//    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//    }
//}
}
