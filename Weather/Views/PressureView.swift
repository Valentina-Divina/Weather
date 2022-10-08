//
//  PressureView.swift
//  Weather
//
//  Created by Valya on 03.10.2022.
//

import UIKit
import SnapKit

class PressureView: UIView {
    let pressure = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let pressureImg = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func initialize() {
        initLabel(targetLabel: pressure, text: "1021 %", font: UIFont(name: "Helvetica", size: 30), center: center)
        pressureImg.contentMode = .scaleAspectFit
        pressureImg.image = UIImage(named: "pressure")
        
        addSubview(pressureImg)
        
        pressureConstrain()
        pressureImgConstrain()
    }
    
    // MARK: - Label initialization func
    func initLabel(targetLabel: UILabel, text: String, font:UIFont?, center: CGPoint) {
        
        targetLabel.font = font
        targetLabel.textColor = .white
        targetLabel.center = center
        targetLabel.textAlignment = .center
        targetLabel.numberOfLines = 1
        targetLabel.text = text
        targetLabel.lineBreakMode = .byTruncatingTail
        
        addSubview(targetLabel)
    }
    
    // MARK: - pressureImgConstrain
    func pressureImgConstrain (){
        pressureImg.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.height.width.equalTo(40)
            maker.bottom.equalTo(pressure.snp.top)
        }
    }
    
    // MARK: - pressureConstrain
    func pressureConstrain() {
        pressure.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
        }
    }
}
