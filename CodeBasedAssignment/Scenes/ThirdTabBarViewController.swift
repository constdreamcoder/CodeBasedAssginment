//
//  ThirdTabBarViewController.swift
//  CodeBasedAssignment
//
//  Created by SUCHAN CHANG on 1/27/24.
//

import UIKit
import SnapKit

class ThirdTabBarViewController: UIViewController {

    let functionLabel = UILabel()
    let descriptionLabel = UILabel()
    
    lazy var topDescriptionContainerStackView = UIStackView(arrangedSubviews: [functionLabel, descriptionLabel])
    
    let dummyImageView = UIImageView()
    
    let settingButton = UIButton()
    let lookUpStorableContentsButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureContraints()
        configureViewController()
        configureUserEvents()
    }
}

extension ThirdTabBarViewController: UIViewControllerConfigurationProtocol {
    func configureUserEvents() {
        
    }
    
    func configureNavigationBar() {
        navigationItem.title = tabBarController?.tabBar.items?[2].title
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 20.0, weight: .bold)]
    }
    
    func configureContraints() {
        [
            topDescriptionContainerStackView,
            dummyImageView,
            settingButton,
            lookUpStorableContentsButton
        ].forEach { view.addSubview($0) }
        
        topDescriptionContainerStackView.snp.makeConstraints {
            $0.bottom.equalTo(dummyImageView.snp.top).offset(-8.0)
            $0.horizontalEdges.equalToSuperview().inset(24.0)
        }
        
        dummyImageView.snp.makeConstraints {
            $0.center.equalTo(view.safeAreaLayoutGuide.snp.center)
        }
        
        settingButton.snp.makeConstraints {
            $0.top.equalTo(dummyImageView.snp.bottom).offset(36.0)
            $0.width.equalTo(lookUpStorableContentsButton.snp.width).offset(80)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40.0)
        }
        
        lookUpStorableContentsButton.snp.makeConstraints {
            $0.top.equalTo(settingButton.snp.bottom).offset(16.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40.0)
        }
    }
    
    func configureViewController() {
        view.backgroundColor = .black
        
        dummyImageView.image = UIImage(named: "dummy")
        dummyImageView.contentMode = .scaleToFill
        
        functionLabel.text = "'나만의 자동 저장' 기능"
        functionLabel.textColor = .white
        functionLabel.textAlignment = .center
        functionLabel.font = .systemFont(ofSize: 24.0, weight: .bold)
        
        descriptionLabel.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다.\n디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
        descriptionLabel.numberOfLines = 3
        descriptionLabel.textColor = .darkGray
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 14.0)
        
        topDescriptionContainerStackView.axis = .vertical
        topDescriptionContainerStackView.distribution = .fillProportionally
        topDescriptionContainerStackView.spacing = 12
        
        var settingButtonConfiguration = UIButton.Configuration.filled()
        settingButtonConfiguration.title = "설정하기"
        settingButtonConfiguration.baseForegroundColor = .white
        settingButtonConfiguration.baseBackgroundColor = .systemBlue
        var settingButtonTitleAttr = AttributedString("설정하기")
        settingButtonTitleAttr.font = .systemFont(ofSize: 17.0, weight: .bold)
        settingButtonConfiguration.attributedTitle = settingButtonTitleAttr
        settingButton.configuration = settingButtonConfiguration
        
        var lookUpStorableContentsButtonConfiguration = UIButton.Configuration.filled()
        lookUpStorableContentsButtonConfiguration.title = "저장 가능한 콘텐츠 살펴보기"
        lookUpStorableContentsButtonConfiguration.baseForegroundColor = .black
        lookUpStorableContentsButtonConfiguration.baseBackgroundColor = .white
        lookUpStorableContentsButton.configuration = lookUpStorableContentsButtonConfiguration
    }
}

#Preview {
    ThirdTabBarViewController()
}
