//
//  WindSpeedView.swift
//  Weather
//
//  Created by Valya on 03.10.2022.
//

import UIKit
import SnapKit

class WindSpeedView: UIView {
    let windSpeed = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let windSpeedImg = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func initialize() {
        initLabel(targetLabel: windSpeed, text: "4 м/c", font: UIFont(name: "Helvetica", size: 30), center: center)
        windSpeedImg.contentMode = .scaleAspectFit
        windSpeedImg.image = UIImage(named: "wind_speed")
        
        addSubview(windSpeedImg)
        
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
        windSpeedImg.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.height.width.equalTo(40)
            maker.bottom.equalTo(windSpeed.snp.top)
        }
    }
    
    // MARK: - humidityConstrain
    func humidityConstrain() {
        windSpeed.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
        }
    }
}

