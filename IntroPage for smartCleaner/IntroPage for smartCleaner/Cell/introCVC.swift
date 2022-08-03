//
//  introCVC.swift
//  IntroPage for smartCleaner
//
//  Created by MD Tarif khan on 20/7/22.
//

import UIKit

class introCVC: UICollectionViewCell {
    
    static let identifier = String(describing: introCVC.self)
    
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bottomView.roundCorners(corners: [.topRight, .topLeft], radius: 30)

    }
    
    func setup(_ slide: IntroItem){
        bannerImage.image = slide.image
        headerTitle.text = slide.headerTitle
        subTitle.text = slide.subTitle
    }
    
}

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
