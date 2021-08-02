//
//  FristRegistration.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/23/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import Firebase
class FristRegistration: UIViewController , UICollectionViewDataSource ,UICollectionViewDelegate {
    
    @IBOutlet weak var CollectionSplach: UICollectionView!
    @IBOutlet weak var CreateNewJob: UIButton!
    @IBOutlet weak var TxtJobAdministrative: UITextField!
    
    @IBOutlet weak var ButtJobAdministrative: UIButton!
    @IBOutlet weak var CollectionReg: UICollectionView!
    @IBOutlet weak var MainViewSuper: UIView!
    
    @IBOutlet weak var IMGSwat: UIImageView!
   
    
    private var Jobs = [JobModel]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionReg.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .black)
        MainViewSuper.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .white)
        self.CollectionReg.dataSource = self
        self.CollectionReg.delegate = self
        CollectionReg.register(UINib(nibName: "RegCollection", bundle: nil), forCellWithReuseIdentifier: "JobCell")
        // Splach Collection
        
        self.CollectionSplach.dataSource = self
            self.CollectionSplach.delegate = self
            CollectionSplach.register(UINib(nibName: "SplachCell", bundle: nil), forCellWithReuseIdentifier: "cellSplach")
        self.CollectionReg.alwaysBounceHorizontal = true
        self.CollectionReg.bounces = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector ( LoginView.ReverseView))
        IMGSwat.addGestureRecognizer(tapGestureRecognizer)
        // لكي الصوره تعمل
        IMGSwat.isUserInteractionEnabled = true
       // ObserveFromFireBase()
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.ChangAutoCollectionCell), userInfo: nil, repeats: true)
        }
        CollectionSplach.translatesAutoresizingMaskIntoConstraints = false
        CollectionSplach.isPagingEnabled = true
        self.navigationController?.navigationBar.isHidden = true
        ButtJobAdministrative.alpha = 0
        TxtJobAdministrative.alpha = 0
        TxtJobAdministrative.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .black)
        ButtJobAdministrative.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .black)
        ObserveFromFireBase()
    }
    
    
    @IBAction func CreateNewAdvirtisment(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
                  self.ButtJobAdministrative.alpha = 1
                  self.TxtJobAdministrative.alpha = 1
              }
    }
    
    // splach
    var timer = Timer()
    var counter = 0
    
    @objc func ChangAutoCollectionCell ()
    {
        if counter < IMGSplach.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.CollectionSplach.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.CollectionSplach.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
          //  pagecontroller.currentPage = counter
        }
    }

    // create observation "Listen" to add new Jobs
    func ObserveFromFireBase() {
        let databasRef = Database.database().reference()
        databasRef.child("Administrative").observe(.childAdded) { (snapshot) in
            
          // to access array from database to tableView
        if let dataArray = snapshot.value as? [String : Any] {
         if let NameJob = dataArray["Administrative Name"] as? String {
          let job  = JobModel.init(JobID: snapshot.key, JobName: NameJob)
             self.Jobs.append(job)
              // refresh table
                self.CollectionReg.reloadData()
                    print(job.JobName!)
            }
        }
        }
    }
    
    @objc func ReverseView(){
        self.navigationController?.popViewController(animated: true)
       }
    
    // Create New Administrative
    @IBAction func SaveJobAdministrative(_ sender: UIButton) {
        guard let JobName = self.TxtJobAdministrative.text , JobName.isEmpty == false else {return}
           // to create Room in firebase
           let databaseRef = Database.database().reference()
           // to create room containe any message
        let room = databaseRef.child("Administrative").childByAutoId()
           let datarry : [String : Any] = ["Administrative Name" : JobName]
           // complition block to must transfer data without errore
           room.setValue(datarry) { (errore, ref) in
               if(errore == nil){
                   self.TxtJobAdministrative.text = ""
               }
           }
        UIView.animate(withDuration: 1) {
                         self.ButtJobAdministrative.alpha = 0
                         self.TxtJobAdministrative.alpha = 0
                     }
            }
    
    let IMGSplach = ["Operation" ,"secuirty","hh","secuirty"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == CollectionReg {
        return Jobs.count
        } else {
            return IMGSplach.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == CollectionReg {
        let job = self.Jobs[indexPath.row]

        let cell = CollectionReg.dequeueReusableCell(withReuseIdentifier: "JobCell", for: indexPath) as! RegCollection
        cell.LBLName.text = job.JobName
        cell.IMGReg.image = UIImage(named: "HR")
        
        if indexPath.row % 2 == 0{
            cell.StackJobLbl.alignment = .trailing
        }else{
            cell.StackJobLbl.alignment = .leading
        }
        return cell
        }
        else {
             let cell = CollectionSplach.dequeueReusableCell(withReuseIdentifier: "cellSplach", for: indexPath) as! SplachCell
            cell.IMGSplach.image = UIImage(named: IMGSplach[indexPath.row])
            return cell

        }
    }
    // create observation "Listen" to add new room in tableview from database
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         
         let width = CollectionSplach.frame.size.width
         let hight = CollectionSplach.frame.size.height
         return CGSize(width: width, height: hight)
     }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
   
        let SelectJob = Jobs[indexPath.row]
        let RegistrationInfo = self.storyboard?.instantiateViewController(withIdentifier: "Info") as! RegistrationView
        RegistrationInfo.KindJob = SelectJob
        self.navigationController?.pushViewController(RegistrationInfo, animated: true)

}
    }

