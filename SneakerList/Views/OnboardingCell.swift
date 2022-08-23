//  Created by Daniyar Mamadov on 23.08.2022.

import UIKit

final internal class OnboardingCell: UICollectionViewCell {
    
    internal static let identifier = "OnboardingCellID"
    
    private let layout = UILayout()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "SharpSans-Medium", size: 32)
        view.textColor = layout.blackColor
        view.numberOfLines = 0
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -24),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func configureCell(titleText: String, image: UIImage) {
        titleLabel.text = titleText
        imageView.image = image
    }
    
}
