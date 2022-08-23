//  Created by Daniyar Mamadov on 23.08.2022.

import UIKit

final internal class UILayout {
    
    internal let whiteColor = UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.00)
    internal let blackColor = UIColor(red: 0.09, green: 0.10, blue: 0.11, alpha: 1.00)
    internal let orangeColor = UIColor(red: 1.00, green: 0.31, blue: 0.05, alpha: 1.00)
    internal let greyColor = UIColor(red: 0.90, green: 0.90, blue: 0.93, alpha: 1.00)
    internal let blueColor = UIColor(red: 0.18, green: 0.45, blue: 0.88, alpha: 1.00)
        
    internal func setup(_ view: UIView, subview: UIView...) {
        subview.forEach {
            view.addSubview($0)
        }
    }
    
    internal func setup(_ stackView: UIStackView, arrangedSubview: UIView...) {
        arrangedSubview.forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    internal func getStackView(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, spacing: CGFloat) -> UIStackView {
        let view = UIStackView()
        view.axis = axis
        view.distribution = distribution
        view.spacing = spacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    internal func getTextField(placeholder: String, isPassword: Bool) -> UITextField {
        let view = UITextField()
        view.placeholder = placeholder
        view.clearButtonMode = .whileEditing
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.spellCheckingType = .no
        view.returnKeyType = .next
        view.borderStyle = .roundedRect
        view.backgroundColor = .white
        view.isSecureTextEntry = isPassword
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    internal func getButton(title: String, titleColor: UIColor, backgroundColor: UIColor, target: Any?, action: Selector) -> UIButton {
        let view = UIButton()
        view.setTitle(title, for: .normal)
        view.setTitleColor(titleColor, for: .normal)
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        view.titleLabel?.textAlignment = .center
        view.addTarget(target, action: action, for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
