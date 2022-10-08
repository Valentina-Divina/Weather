//
//  HumidityView.swift
//  Weather
//
//  Created by Valya on 01.10.2022.
//

import UIKit
import SnapKit

class HumidityView: UIView {
    let humidity = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let humidityImg = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func initialize() {
        initLabel(targetLabel: humidity, text: "76 %", font: UIFont(name: "Helvetica", size: 30), center: center)
        humidityImg.contentMode = .scaleAspectFit
        humidityImg.image = UIImage(named: "humidity")
        
        addSubview(humidityImg)
        
        humidityConstrain()
        humidityImgConstrain()
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
    
    // MARK: - humidityImgConstrain
    func humidityImgConstrain (){
        humidityImg.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.height.width.equalTo(40)
            maker.bottom.equalTo(humidity.snp.top)
        }
    }
    
    // MARK: - humidityConstrain
    func humidityConstrain() {
        humidity.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
        }
    }
}

