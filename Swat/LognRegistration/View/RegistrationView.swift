//
//  RegistrationView.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/27/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class RegistrationView: UIViewController, PasseNameCountry {
    func NameCountry(name: String) {
        TextGoverment.text = name
    }
    
    @objc func ReverseView(){
       self.navigationController?.popViewController(animated: true)
      }
    
    @IBOutlet weak var IMGBack: UIImageView!
    @IBOutlet weak var Demand: UIButton!
    @IBOutlet weak var Exemption: UIButton!
    @IBOutlet weak var LedService: UIButton!
    @IBOutlet weak var Recruitment: UIView!
    
    @IBOutlet weak var Save: UIButton!
    @IBOutlet weak var Speciallicense: UIButton!
    @IBOutlet weak var Professionallicense: UIButton!
    @IBOutlet weak var NoLicesese: UIButton!
    
    @IBOutlet weak var AgeText: UITextField!
    @IBOutlet weak var NumPhoneText: UITextField!
    
    @IBOutlet weak var GovermentText: UITextField!
    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var AddressCard: UITextField!
    @IBOutlet weak var LiteracyَQualification: UIButton!
    @IBOutlet weak var HighQualification: UIButton!
    @IBOutlet weak var AVGQualification: UIButton!
    @IBOutlet weak var NoQualification: UIButton!
    
    @IBOutlet weak var Christianity: mycutombutton!
    @IBOutlet weak var Muslim: mycutombutton!
    
    @IBOutlet weak var Unmarried: UIButton!
    @IBOutlet weak var divorced: UIButton!
    @IBOutlet weak var Married: UIButton!
    
    @IBOutlet weak var PhoneImage: UIImageView!
    @IBOutlet weak var AddressImage: UIImageView!
    @IBOutlet weak var GovermentImage: UIImageView!
    @IBOutlet weak var NameImage: UIImageView!
    @IBOutlet var AllText: [UITextField]!
    
    
    @IBOutlet weak var LicenseView: UIView!
    @IBOutlet weak var AgeView: UIView!
    @IBOutlet weak var BirthDayView: UIView!
    @IBOutlet weak var ReligionView: UIView!
    @IBOutlet weak var MartialView: UIView!
    @IBOutlet weak var NumberView: UIView!
    @IBOutlet weak var AddressView: UIView!
    @IBOutlet weak var GovermentView: UIView!
    @IBOutlet weak var MainView: circle!
    @IBOutlet weak var QualificationView: UIView!
    @IBOutlet weak var NameView: UIView!
    
     private var SocialStatus : String?
     private var RelgionString : String?
     private var QualificationString : String?
     private var LicenseString : String?
     private var RecruitmentString : String?
    
    var KindJob : JobModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector ( RegistrationView.ReverseView))
               IMGBack.addGestureRecognizer(tapGestureRecognizer)
               // لكي الصوره تعمل
               IMGBack.isUserInteractionEnabled = true
        
        Save.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .white)
        Recruitment.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
        Speciallicense.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .lightGray)
        Professionallicense.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .lightGray)
        NoLicesese.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .lightGray)
        
        LiteracyَQualification.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .lightGray)
        HighQualification.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .lightGray)
        AVGQualification.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .lightGray)
        NoQualification.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .lightGray)
        
        Unmarried.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .lightGray)
        divorced.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .lightGray)
        Married.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .lightGray)
        
        Demand.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .lightGray)
        LedService.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .lightGray)
        Exemption.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .lightGray)

        MainView.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .white)
        NameView.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
        LicenseView.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
        AgeView.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
        BirthDayView.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
        ReligionView.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
        MartialView.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
        NumberView.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
        AddressView.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
        GovermentView.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
        QualificationView.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
     //   print(KindJob?.JobName)
        for text in AllText {
            text.delegate = self
        }
        print(KindJob!.JobID!)

    }
    
    @IBAction func NoLicense(_ sender: UIButton) {
        LicenseView.layer.borderColor = UIColor.black.cgColor
        NoLicesese.layer.borderColor = UIColor.red.cgColor
        Professionallicense.layer.borderColor = UIColor.lightGray.cgColor
        Speciallicense.layer.borderColor = UIColor.lightGray.cgColor
         
        NoLicesese.setTitleColor(UIColor.black, for: .normal)
        Professionallicense.setTitleColor(UIColor.lightGray, for: .normal)
        Speciallicense.setTitleColor(UIColor.lightGray, for: .normal)
        
        LicenseString = NoLicesese.titleLabel!.text
    }
    
    @IBAction func SpeciallicensButt(_ sender: UIButton) {
        LicenseView.layer.borderColor = UIColor.black.cgColor
         NoLicesese.layer.borderColor = UIColor.lightGray.cgColor
         Professionallicense.layer.borderColor = UIColor.lightGray.cgColor
         Speciallicense.layer.borderColor = UIColor.red.cgColor
        
        NoLicesese.setTitleColor(UIColor.lightGray, for: .normal)
        Professionallicense.setTitleColor(UIColor.lightGray, for: .normal)
        Speciallicense.setTitleColor(UIColor.black, for: .normal)
        
        LicenseString = Speciallicense.titleLabel!.text

    }
    
    @IBAction func ProfessinaLicenButt(_ sender: UIButton) {
        LicenseView.layer.borderColor = UIColor.black.cgColor
        NoLicesese.layer.borderColor = UIColor.lightGray.cgColor
        Professionallicense.layer.borderColor = UIColor.red.cgColor
        Speciallicense.layer.borderColor = UIColor.lightGray.cgColor
        
        NoLicesese.setTitleColor(UIColor.lightGray, for: .normal)
        Professionallicense.setTitleColor(UIColor.black, for: .normal)
        Speciallicense.setTitleColor(UIColor.lightGray, for: .normal)
        
        LicenseString = Professionallicense.titleLabel!.text

        }
    
    @IBAction func HighQualiButt(_ sender: UIButton) {
        QualificationView.layer.borderColor = UIColor.black.cgColor
        LiteracyَQualification.layer.borderColor = UIColor.lightGray.cgColor
        HighQualification.layer.borderColor = UIColor.red.cgColor
        AVGQualification.layer.borderColor = UIColor.lightGray.cgColor
        NoQualification.layer.borderColor = UIColor.lightGray.cgColor
        LiteracyَQualification.setTitleColor(UIColor.lightGray, for: .normal)
        HighQualification.setTitleColor(UIColor.black, for: .normal)
        NoQualification.setTitleColor(UIColor.lightGray, for: .normal)
        AVGQualification.setTitleColor(UIColor.lightGray, for: .normal)
        
        QualificationString = HighQualification.titleLabel!.text

    }
    
    @IBAction func AVGQualiButt(_ sender: UIButton) {
        QualificationView.layer.borderColor = UIColor.black.cgColor
        LiteracyَQualification.layer.borderColor = UIColor.lightGray.cgColor
        HighQualification.layer.borderColor = UIColor.lightGray.cgColor
        AVGQualification.layer.borderColor = UIColor.red.cgColor
        NoQualification.layer.borderColor = UIColor.lightGray.cgColor
        LiteracyَQualification.setTitleColor(UIColor.lightGray, for: .normal)
        HighQualification.setTitleColor(UIColor.lightGray, for: .normal)
        NoQualification.setTitleColor(UIColor.lightGray, for: .normal)
        AVGQualification.setTitleColor(UIColor.black, for: .normal)
        
        QualificationString = AVGQualification.titleLabel!.text

    }
    
    @IBAction func LiteraQualifButt(_ sender: UIButton) {
        QualificationView.layer.borderColor = UIColor.black.cgColor
        LiteracyَQualification.layer.borderColor = UIColor.red.cgColor
        HighQualification.layer.borderColor = UIColor.lightGray.cgColor
        AVGQualification.layer.borderColor = UIColor.lightGray.cgColor
        NoQualification.layer.borderColor = UIColor.lightGray.cgColor
        LiteracyَQualification.setTitleColor(UIColor.black, for: .normal)
        HighQualification.setTitleColor(UIColor.lightGray, for: .normal)
        NoQualification.setTitleColor(UIColor.lightGray, for: .normal)
        AVGQualification.setTitleColor(UIColor.lightGray, for: .normal)
        
        QualificationString = LiteracyَQualification.titleLabel!.text
    }
    
    @IBAction func NoQualifButt(_ sender: UIButton) {
        QualificationView.layer.borderColor = UIColor.red.cgColor
        LiteracyَQualification.layer.borderColor = UIColor.lightGray.cgColor
        HighQualification.layer.borderColor = UIColor.lightGray.cgColor
        AVGQualification.layer.borderColor = UIColor.lightGray.cgColor
        NoQualification.layer.borderColor = UIColor.red.cgColor
        LiteracyَQualification.setTitleColor(UIColor.lightGray, for: .normal)
        HighQualification.setTitleColor(UIColor.lightGray, for: .normal)
        NoQualification.setTitleColor(UIColor.black, for: .normal)
        AVGQualification.setTitleColor(UIColor.lightGray, for: .normal)
        
        QualificationString = NoQualification.titleLabel!.text
    }
    
    @IBAction func SaveButt(_ sender: UIButton) {
        Save.backgroundColor = .orange
        Save.setTitleColor(UIColor.white, for: .normal)
        
        // Condition & Vilidtion
        guard let name = NameText.text?.trimmend , !name.isEmpty else {
            Validat_Termining_alert.showAlert(message: "Pleas Enter Your name", my: self)
            
            return
        }
        
        if SocialStatus == nil {
               Validat_Termining_alert.showAlert(message: "Pleas Choose Your Social status", my: self)
        }
        
        if RelgionString == nil {
               Validat_Termining_alert.showAlert(message: "Pleas Choose Your Relgion", my: self)
        }
        
        if QualificationString == nil {
                     Validat_Termining_alert.showAlert(message: "Pleas Choose Your Qualification", my: self)
        }
        if RecruitmentString == nil {
               Validat_Termining_alert.showAlert(message: "Pleas Choose Your Recruitment", my: self)
        }
        
        guard let NameGoverment = GovermentText.text, !NameGoverment.isEmpty else {
                 Validat_Termining_alert.showAlert(message: "Pleas Choose Your Goverment", my: self)
                return
        }
        guard let Adress = AddressCard.text?.trimmend, !Adress.isEmpty else {
            Validat_Termining_alert.showAlert(message: "Pleas Enter Your Adress", my: self)
           return
        }

        
        guard let Age = AgeText.text?.trimmend , !Age.isEmpty else {
            Validat_Termining_alert.showAlert(message: "Pleas Enter Your Age", my: self)
            return
        }
        if !Validat_Termining_alert.isValidAge(TestAge: Age){
            Validat_Termining_alert.showAlert(message: "Pleas Enter Correct Age", my: self)
            return
        }
        
        guard let Phone = NumPhoneText.text, !Phone.isEmpty else {
            Validat_Termining_alert.showAlert(message: "Pleas enter your Phone", my: self)
            return
        }
        if !Phone.isPhoneNumber{
            Validat_Termining_alert.showAlert(message: "Pleas enter correcet Phone", my: self)
            return
        }

        let UserDetial = UserModel(name: name, Age: Age, address: Adress, phoneNumber: Phone, Goverment: NameGoverment, Recruitment: RecruitmentString, License: LicenseString, Qualification: QualificationString, Relgion: RelgionString, SocialStatus: SocialStatus,JobID : KindJob!.JobID!)
      //  let JobsAdminstrative = JobModel(JobName: KindJob?.JobName)
        let JobsAdminstrative = JobModel(JobID: KindJob!.JobID!, JobName: KindJob!.JobName!)
       // print(JobsAdminstrative)
       

               let VCRegistration = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegistrationID") as! FinalRegisterEmail

        VCRegistration.infoUserFinalRegister = UserDetial
        VCRegistration.RegisterWithJob = JobsAdminstrative
         self.navigationController?.pushViewController(VCRegistration, animated: true)
               
          //     self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    
    @IBAction func Christianity(_ sender: UIButton) {
        Christianity.layer.borderColor = UIColor.red.cgColor
        Muslim.layer.borderColor = UIColor.lightGray.cgColor
        ReligionView.layer.borderColor = UIColor.black.cgColor
        
        Muslim.setTitleColor(UIColor.lightGray, for: .normal)
        Christianity.setTitleColor(UIColor.black, for: .normal)
        RelgionString = Christianity.titleLabel!.text
        }
    
    @IBAction func MuslimButt(_ sender: UIButton) {
        Christianity.layer.borderColor = UIColor.lightGray.cgColor
        Muslim.layer.borderColor = UIColor.red.cgColor
        ReligionView.layer.borderColor = UIColor.black.cgColor
        
        Muslim.setTitleColor(UIColor.black, for: .normal)
        Christianity.setTitleColor(UIColor.lightGray, for: .normal)
        RelgionString = Muslim.titleLabel!.text
    }
    
    @IBAction func divorced(_ sender: UIButton) {
        Married.layer.borderColor = UIColor.lightGray.cgColor
        Unmarried.layer.borderColor = UIColor.lightGray.cgColor
        divorced.layer.borderColor = UIColor.red.cgColor
        MartialView.layer.borderColor = UIColor.black.cgColor
        
        divorced.setTitleColor(UIColor.black, for: .normal)
        Unmarried.setTitleColor(UIColor.lightGray, for: .normal)
        Married.setTitleColor(UIColor.lightGray, for: .normal)
        
        SocialStatus = divorced.titleLabel!.text
    }
    
    @IBAction func Married(_ sender: UIButton) {
        Married.layer.borderColor = UIColor.red.cgColor
        Unmarried.layer.borderColor = UIColor.lightGray.cgColor
        divorced.layer.borderColor = UIColor.lightGray.cgColor
        MartialView.layer.borderColor = UIColor.black.cgColor
        
        divorced.setTitleColor(UIColor.lightGray, for: .normal)
        Unmarried.setTitleColor(UIColor.lightGray, for: .normal)
        Married.setTitleColor(UIColor.black, for: .normal)
        
       SocialStatus = Married.titleLabel!.text
    }
    @IBAction func UnMarried(_ sender: UIButton) {
        Married.layer.borderColor = UIColor.lightGray.cgColor
        Unmarried.layer.borderColor = UIColor.red.cgColor
        divorced.layer.borderColor = UIColor.lightGray.cgColor
        MartialView.layer.borderColor = UIColor.black.cgColor
        
        divorced.setTitleColor(UIColor.lightGray, for: .normal)
        Unmarried.setTitleColor(UIColor.black, for: .normal)
        Married.setTitleColor(UIColor.lightGray, for: .normal)
        
        SocialStatus = Unmarried.titleLabel!.text
    }
    
    @IBAction func DemandButt(_ sender: UIButton) {
        Demand.layer.borderColor = UIColor.red.cgColor
        Exemption.layer.borderColor = UIColor.lightGray.cgColor
        LedService.layer.borderColor = UIColor.lightGray.cgColor
        
        Recruitment.layer.borderColor = UIColor.black.cgColor
        
        Exemption.setTitleColor(UIColor.lightGray, for: .normal)
        LedService.setTitleColor(UIColor.lightGray, for: .normal)
        Demand.setTitleColor(UIColor.black, for: .normal)
        RecruitmentString = Demand.titleLabel!.text
        
    }
    
    @IBAction func ExemptionButt(_ sender: UIButton) {
        
        Demand.layer.borderColor = UIColor.lightGray.cgColor
        Exemption.layer.borderColor = UIColor.red.cgColor
        LedService.layer.borderColor = UIColor.lightGray.cgColor
        
        Recruitment.layer.borderColor = UIColor.black.cgColor
        
        Exemption.setTitleColor(UIColor.black, for: .normal)
        LedService.setTitleColor(UIColor.lightGray, for: .normal)
        Demand.setTitleColor(UIColor.lightGray, for: .normal)
        RecruitmentString = Exemption.titleLabel!.text

    }
    
    @IBAction func LedServiceButt(_ sender: UIButton) {
        
        Demand.layer.borderColor = UIColor.lightGray.cgColor
        Exemption.layer.borderColor = UIColor.lightGray.cgColor
        LedService.layer.borderColor = UIColor.red.cgColor
        
        Recruitment.layer.borderColor = UIColor.black.cgColor
        
        Exemption.setTitleColor(UIColor.lightGray, for: .normal)
        LedService.setTitleColor(UIColor.black, for: .normal)
        Demand.setTitleColor(UIColor.lightGray, for: .normal)
        RecruitmentString = LedService.titleLabel!.text

    }
    
    @IBAction func ButtGoverment(_ sender: UIButton) {
  //   ViewController.trans(name: "viewGoverment", my: self)
        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectItemView") as! SlidCountry
               vc.delegate = self
               vc.modalPresentationStyle = .overCurrentContext
               present(vc, animated: true, completion: nil)
        print("Welcom")
        GovermentView.layer.borderColor = UIColor.black.cgColor
        self.GovermentImage.image = UIImage(named: "Subtraction 2-1")

    }
    @IBOutlet weak var TextGoverment: UITextField!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           dismiss(animated: true, completion: nil)
       }
    
}

// Text Change Border
extension RegistrationView : UITextFieldDelegate {
    
   func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0{
            if textField.text!.isEmpty{
                self.NameImage.image = UIImage(named: "Subtraction 3")
                NameView.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
            }else{
                self.NameImage.image = UIImage(named: "Subtraction 3-1")
                NameView.layer.borderColor = UIColor.black.cgColor
                
            }
            
        }else if textField.tag == 1 {
            if textField.text!.isEmpty {
                GovermentView.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
                self.GovermentImage.image = UIImage(named: "Subtraction 2")
            
            } else {
                GovermentView.layer.borderColor = UIColor.black.cgColor
                self.GovermentImage.image = UIImage(named: "Subtraction 2-1")
                
            }
        } else if textField.tag == 2 {
            if textField.text!.isEmpty {
                AddressView.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
                self.AddressImage.image = UIImage(named: "Subtraction 2")
                
            } else {
                AddressView.layer.borderColor = UIColor.black.cgColor
                self.AddressImage.image = UIImage(named: "Subtraction 2-1")
                }
        } else if textField.tag == 3 {
            if textField.text!.isEmpty {
                NumberView.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
                self.PhoneImage.image = UIImage(named: "phone")
                
            } else {
                NumberView.layer.borderColor = UIColor.black.cgColor
                self.PhoneImage.image = UIImage(named: "phone-1")
            }
            
        } else if textField.tag == 4 || textField.tag == 5 || textField.tag == 6 {
            if textField.text!.isEmpty {
                BirthDayView.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
                
            } else {
                BirthDayView.layer.borderColor = UIColor.black.cgColor
                
            }
        }else if textField.tag == 7 {
            if textField.text!.isEmpty {
                AgeView.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
                
            } else {
                AgeView.layer.borderColor = UIColor.black.cgColor
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField.tag == 0 {
            NameView.layer.borderColor = UIColor.red.cgColor
            self.NameImage.image = UIImage(named: "Subtraction 3-1")
            
        } else if textField.tag == 1 {
            
            GovermentView.layer.borderColor = UIColor.red.cgColor
            self.GovermentImage.image = UIImage(named: "Subtraction 2-1")
            
        } else if textField.tag == 2 {
            
            AddressView.layer.borderColor = UIColor.red.cgColor
            self.AddressImage.image = UIImage(named: "Subtraction 2-1")
            
        }else if textField.tag == 3 {
            NumberView.layer.borderColor = UIColor.red.cgColor
            self.PhoneImage.image = UIImage(named: "phone-1")
            
   } else if textField.tag == 4 || textField.tag == 5 || textField.tag == 6 {
            BirthDayView.layer.borderColor = UIColor.red.cgColor
   }else if textField.tag == 7 {
    AgeView.layer.borderColor = UIColor.red.cgColor
        }
}
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if AllText[0].text!.isEmpty || AllText[1].text!.isEmpty || AllText[2].text!.isEmpty || AllText[3].text!.isEmpty || AllText[4].text!.isEmpty  {
            self.Save.backgroundColor = UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 1)
        }else{
            self.Save.backgroundColor = .orange
        }
        return true
    }
}

