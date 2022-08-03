//
//  ViewController.swift
//  IntroPage for smartCleaner
//
//  Created by MD Tarif khan on 20/7/22.
//

import UIKit

struct IntroItem{
    let image: UIImage?
    let smartTitle: String
    let headerTitle: String
    let subTitle: String
    let view: UIColor
}

class IntroPageController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var introCollectionView: UICollectionView!
    @IBOutlet weak var continueButton: UIButton!
    var currentPage = 0{
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == bannerImages.count - 1{
                continueButton.setTitle("Get Started", for: .normal)
            }else{
                continueButton.setTitle("Continue", for: .normal)
            }
        }
    }
    
    

    var bannerImages: [IntroItem] = [
        IntroItem(image: UIImage(named: "intro_1_im"), smartTitle: "Smart Cleaner", headerTitle: "ONE TAP", subTitle: "Clean up your device with on tap", view: .red),
        IntroItem(image: UIImage(named: "intro_2_im"), smartTitle: " ", headerTitle: "REMOVE UNNECESSARY PHOTOS AND VIDEOS", subTitle: "Auto detect similar photos and keep best one", view: .red),
        IntroItem(image: UIImage(named: "intro_3_im"), smartTitle: " ", headerTitle: "MERGE DUPLICATE CONTACTS", subTitle: "Merge duplicate contacts and be free your phone space", view: .red),

    ]
    override func viewDidLoad() {
        super.viewDidLoad()
            setup()
    }
    
    func setup(){
        introCollectionView.delegate = self
        introCollectionView.dataSource = self
        continueButton.setTitle("Continue", for: .normal)
    }
    
    
    //MARK: - Button Action.
    @IBAction func continueAction(_ sender: UIButton) {
        
        if currentPage == bannerImages.count - 1{
            //Get start code.
            let storyboard = UIStoryboard(name: "AllowVC", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "AllowVC")
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)

        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
           introCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
}
    
    @IBAction func skipAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AllowVC", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AllowVC")
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
}

extension IntroPageController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = introCollectionView.dequeueReusableCell(withReuseIdentifier: introCVC.identifier, for: indexPath) as! introCVC
        cell.setup(bannerImages[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
