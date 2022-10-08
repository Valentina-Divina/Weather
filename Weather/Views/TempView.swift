//
//  TempView.swift
//  Weather
//
//  Created by Valya on 29.09.2022.
//

import UIKit

class TempView: UIView {
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    let temp = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let degreeSign = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let сelsiusSymbol = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    private func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        temp.text = "24"
        
        initLabel(targetLabel: temp, text: "21", font: UIFont(name: "Helvetica", size: 70), center: center)
        
        degreeSign.image = UIImage(named: "degree_sign")
        degreeSign.contentMode = .scaleAspectFit
        addSubview(degreeSign)
        
        сelsiusSymbol.image = UIImage(named: "celsius_sign")
        сelsiusSymbol.contentMode = .scaleAspectFit
        addSubview(сelsiusSymbol)
        
        tempConstraints()
        degreeSignConstraints()
        сelsiusSymbolConstraints()
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
    // MARK: - tempConstraints
    
    func tempConstraints(){
        temp.translatesAutoresizingMaskIntoConstraints = false
        let topAnchor = temp.topAnchor.constraint(equalTo: topAnchor, constant: 0)
        let bottomAnchor = temp.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0 )
        let centerAnchor = temp.centerXAnchor.constraint(equalTo: centerXAnchor)
        NSLayoutConstraint.activate([topAnchor, bottomAnchor, centerAnchor])
    }
    
    // MARK: - degreeSign
    
    func degreeSignConstraints(){
        degreeSign.translatesAutoresizingMaskIntoConstraints = false
        let topAnchor = degreeSign.topAnchor.constraint(equalTo: temp.topAnchor, constant: 12)
        let bottomAnchor = degreeSign.bottomAnchor.constraint(equalTo: сelsiusSymbol.topAnchor, constant: 0)
        let leftAnchor = degreeSign.leftAnchor.constraint(equalTo: temp.rightAnchor, constant: 0)
        let rightAnchor = degreeSign.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
        NSLayoutConstraint.activate([topAnchor, leftAnchor, rightAnchor])
    }
    
    // MARK: - сelsiusSymbolConstraints
    func сelsiusSymbolConstraints(){
        сelsiusSymbol.translatesAutoresizingMaskIntoConstraints = false
        let topAnchor = сelsiusSymbol.topAnchor.constraint(equalTo: degreeSign.bottomAnchor, constant: 0)
        let bottomAnchor = сelsiusSymbol.bottomAnchor.constraint(equalTo: temp.firstBaselineAnchor, constant: 0)
        let leftAnchor = сelsiusSymbol.leftAnchor.constraint(equalTo: temp.rightAnchor, constant: 0)
        let rightAnchor = сelsiusSymbol.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
        NSLayoutConstraint.activate([bottomAnchor, leftAnchor, rightAnchor])
    }
}
