    //  Created by Daniyar Mamadov on 23.08.2022.

import UIKit

class OnboardingViewController: UIViewController {
    
    private let layout = UILayout()
    
    internal var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == onboardingSlides.count - 1 {
                nextButton.setTitle("Get started", for: .normal)
                nextButton.setTitleColor(layout.whiteColor, for: .normal)
                nextButton.backgroundColor = layout.orangeColor
            } else {
                nextButton.setTitle("Next", for: .normal)
                nextButton.setTitleColor(layout.whiteColor, for: .normal)
                nextButton.backgroundColor = layout.blackColor
            }
        }
    }
    
    private let text1 = """
        Your collection
        of shoes
        is always
        close at hand
        """
    
    private let text2 = """
        Check
        the authenticity
        of your pair
        of shoes
        """
    
    private let text3 = """
        Show
        your collection
        to your friends
        """
    
    internal lazy var onboardingSlides: [OnboardingSlide] = [
        OnboardingSlide(titleText: text1,
                        image: UIImage(named: "image1") ?? UIImage.checkmark),
        OnboardingSlide(titleText: text2,
                        image: UIImage(named: "image2") ?? UIImage.checkmark),
        OnboardingSlide(titleText: text3,
                        image: UIImage(named: "image3") ?? UIImage.checkmark)
    ]
    
    private let onboardingCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.alwaysBounceHorizontal = true
        view.isScrollEnabled = false
        view.isPagingEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    internal lazy var pageControl: UIPageControl = {
        let view = UIPageControl()
        view.numberOfPages = onboardingSlides.count
        view.isUserInteractionEnabled = false
        view.pageIndicatorTintColor = layout.greyColor
        view.currentPageIndicatorTintColor = layout.blackColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nextButton: UIButton = {
        let view = UIButton()
        view.setTitle("Next", for: .normal)
        view.setTitleColor(layout.whiteColor, for: .normal)
        view.backgroundColor = layout.blackColor
        view.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        view.titleLabel?.textAlignment = .center
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "xmark",
                              withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), for: .normal)
        view.tintColor = layout.blackColor
        view.backgroundColor = .clear
        view.layer.borderWidth = 2
        view.layer.borderColor = layout.greyColor.cgColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = layout.whiteColor
        configureCollectionView()
        configureUI()
        setupConstraints()
    }
    
    private func configureUI() {
        layout.setup(view, subview: onboardingCollectionView, pageControl, nextButton, closeButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            closeButton.widthAnchor.constraint(equalToConstant: 48),
            closeButton.heightAnchor.constraint(equalToConstant: 48),
            
            onboardingCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            onboardingCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onboardingCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -40),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            nextButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func configureCollectionView() {
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.identifier)
    }
    
    @objc private func nextButtonTapped() {
        if currentPage == onboardingSlides.count - 1 {
            presentLoginVC()
        } else {
            currentPage += 1
            onboardingCollectionView.isPagingEnabled = false
            onboardingCollectionView.scrollToItem(at: IndexPath(item: currentPage, section: 0),
                                                  at: .centeredHorizontally,
                                                  animated: true)
            onboardingCollectionView.isPagingEnabled = true
        }
        
        
    }
    
    @objc private func closeButtonTapped() {
        presentLoginVC()
    }
    
    private func presentLoginVC() {
        let loginVC = LoginViewController()
        loginVC.modalTransitionStyle = .flipHorizontal
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
}

