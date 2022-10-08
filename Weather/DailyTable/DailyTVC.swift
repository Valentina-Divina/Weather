////
////  DailyTVC.swift
////  Weather
////
////  Created by Valya on 03.10.2022.
////
//
import UIKit
import SnapKit

class DailyTVC: UITableViewCell {
    
    let dayName = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let imageUrl = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let minTemp = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let maxTemp = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func initialize() {
        initLabel(targetLabel: dayName, text: "Пн", font: UIFont(name: "Helvetica", size: 20), center: center)
        initLabel(targetLabel: minTemp, text: "- 10", font: UIFont(name: "Helvetica", size: 20), center: center)
        initLabel(targetLabel: maxTemp, text: "+ 10", font: UIFont(name: "Helvetica", size: 20), center: center)
        imageUrl.contentMode = .scaleAspectFit
        imageUrl.image = UIImage(named: "humidity")
        
        addSubview(imageUrl)
        
        dayNameConstrain()
        imageUrlConstrain()
        minTempConstrain()
        maxTempConstrain()
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
    
    // MARK: - dayNameConstrain
    func dayNameConstrain() {
        dayName.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.left.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - imageUrlConstrain
    func imageUrlConstrain (){
        imageUrl.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(90)
            maker.centerY.equalToSuperview()
        }
    }
    
    // MARK: - minTempConstrain
    func minTempConstrain() {
        minTemp.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.right.equalTo(maxTemp).inset(80)
        }
    }
    
    // MARK: - maxTempConstrain
    func maxTempConstrain() {
        maxTemp.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.right.equalToSuperview().inset(20)
        }
    }
}
