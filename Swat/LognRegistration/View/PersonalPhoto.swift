//
//  PersonalPhoto.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/24/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class PersonalPhoto: UIViewController,UIImagePickerControllerDelegate , UINavigationControllerDelegate{

        @IBOutlet weak var IMGSwat: UIImageView!
        @IBOutlet weak var MainView: circle!
        @IBOutlet weak var LblCardPersonal: UILabel!
        
        @IBOutlet weak var ButtNext: UIButton!
        @IBOutlet weak var PresonalIMG: UIImageView!
        let imagePicker = UIImagePickerController()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // setup image
            IMGSwat.CornerRadiusBorderNum(Radius: 15, BorderWidth: 1, color: .white)
            self.imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            MainView.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .white)
              ButtNext.CornerRadiusBorderNum(Radius: 20, BorderWidth: 1, color: .white)
            PresonalIMG.CornerRadiusBorderNum(Radius: 20, BorderWidth: 1, color: .white)
            // phone
         //   imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            // to do acition
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(PictuerCardAndPersonal.ChooseImage))
            PresonalIMG.addGestureRecognizer(tapGestureRecognizer)
            // لكي الصوره تعمل
            PresonalIMG.isUserInteractionEnabled = true
        }
        
        
        @objc func ChooseImage(img : UIImageView)
             {
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
                 
             }
        
        // choose image
               
               func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
               {
                   let TheImg = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
                  PresonalIMG.image = TheImg
              
    //               ImagBack.backgroundColor = .white
                     LblCardPersonal.isHidden = true
                   
                ButtNext.backgroundColor = .blue
                ButtNext.setTitleColor(.red, for: .normal)
                   dismiss(animated: true, completion: nil)
                   
               }
             
               func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
                   
                   dismiss(animated: true, completion: nil)
               }


}
