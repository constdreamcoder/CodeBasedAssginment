//
//  SecondViewController.swift
//  CodeBasedAssignment
//
//  Created by SUCHAN CHANG on 1/27/24.
//

import UIKit
import SnapKit

class SecondTabBarViewController: UIViewController {
    let searchBar = UISearchBar()
    let searchBarPlaceholderString = "게임, 시리즈, 영화를 검색하세요..."
    
    let toBeReleasedButton = UIButton()
    let popularContentsButton = UIButton()
    let top10SeriesButton = UIButton()
    
    lazy var tabButtonList = [toBeReleasedButton, popularContentsButton, top10SeriesButton]
    lazy var buttonContainerStackView = UIStackView(arrangedSubviews: tabButtonList)
    
    let noContentsMainDescriptionLabel = UILabel()
    let noContentsSubDescriptionLabel = UILabel()
    lazy var noContentsSubDescriptionContainerStackView = UIStackView(arrangedSubviews: [noContentsMainDescriptionLabel, noContentsSubDescriptionLabel])
    
    let contentsContainer = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureContraints()
        configureViewController()
        configureUserEvents()
    }
}

extension SecondTabBarViewController {
    @objc func backgroundViewTapped() {
        view.endEditing(true)
    }
    
    func configureNavigationBar() {
        navigationItem.title = tabBarController?.tabBar.items?[1].title
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 20.0, weight: .bold)]
    }
}

extension SecondTabBarViewController: UIViewControllerConfigurationProtocol {
    func configureUserEvents() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backgroundViewTapped)))
        tabButtonList.forEach { $0.addTarget(self, action: #selector(tabButtonTapped), for: .touchUpInside)}
    }
     
    @objc func tabButtonTapped(_ sender: UIButton) {
        tabButtonList.forEach {
            if sender == $0 {
                sender.configuration?.baseForegroundColor = .black
                sender.configuration?.baseBackgroundColor = .white
            } else {
                $0.configuration?.baseForegroundColor = .white
                $0.configuration?.baseBackgroundColor = .black
            }
        }
    }
    
    func configureContraints() {
        contentsContainer.addSubview(noContentsSubDescriptionContainerStackView)
        
        [
            searchBar,
            buttonContainerStackView,
            contentsContainer
        ].forEach { view.addSubview($0) }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide.snp.horizontalEdges).inset(16)
        }
        
        buttonContainerStackView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide.snp.horizontalEdges)
        }
       
        contentsContainer.snp.makeConstraints {
            $0.top.equalTo(buttonContainerStackView.snp.bottom)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide.snp.horizontalEdges)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        noContentsSubDescriptionContainerStackView.snp.makeConstraints {
            $0.centerX.equalTo(contentsContainer.snp.centerX)
            $0.centerY.equalTo(contentsContainer.snp.centerY).multipliedBy(0.6)
        }
    }
    
    func configureViewController() {
        view.backgroundColor = .black
        
        searchBar.placeholder = searchBarPlaceholderString
        searchBar.barTintColor = .black
        searchBar.searchTextField.backgroundColor = .darkGray
        searchBar.tintColor = .white
        searchBar.searchTextField.leftView?.tintColor = .lightGray
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: searchBarPlaceholderString, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        searchBar.searchTextField.textColor = .white
        
        buttonContainerStackView.axis = .horizontal
        buttonContainerStackView.distribution = .fillProportionally
        buttonContainerStackView.spacing = 8
        
        var toBeReleasedButtonConfiguration = UIButton.Configuration.filled()
        toBeReleasedButtonConfiguration.image = UIImage(named: "blue")
        toBeReleasedButtonConfiguration.baseForegroundColor = .black
        toBeReleasedButtonConfiguration.cornerStyle = .capsule
        toBeReleasedButtonConfiguration.contentInsets = .init(top: 4, leading: 0, bottom: 4, trailing: 0)
        toBeReleasedButtonConfiguration.baseBackgroundColor = .white
        toBeReleasedButtonConfiguration.imagePadding = 4
        var toBeReleasedButtonTitleAttr = AttributedString("공개 예정")
        toBeReleasedButtonTitleAttr.font = .systemFont(ofSize: 14.0)
        toBeReleasedButtonConfiguration.attributedTitle = toBeReleasedButtonTitleAttr
        toBeReleasedButton.configuration = toBeReleasedButtonConfiguration
        
        var popularContentsButtonConfiguration = UIButton.Configuration.filled()
        popularContentsButtonConfiguration.image = UIImage(named: "turquoise")
        popularContentsButtonConfiguration.baseForegroundColor = .white
        popularContentsButtonConfiguration.cornerStyle = .capsule
        popularContentsButtonConfiguration.contentInsets = .init(top: 4, leading: 0, bottom: 4, trailing: 0)
        popularContentsButtonConfiguration.baseBackgroundColor = .clear
        popularContentsButtonConfiguration.imagePadding = 4
        var popularContentsButtonTitleAttr = AttributedString("모두의 인기 콘텐츠")
        popularContentsButtonTitleAttr.font = .systemFont(ofSize: 14.0)
        popularContentsButtonConfiguration.attributedTitle = popularContentsButtonTitleAttr
        popularContentsButton.configuration = popularContentsButtonConfiguration
        
        var top10SeriesButtonConfiguration = UIButton.Configuration.filled()
        top10SeriesButtonConfiguration.image = UIImage(named: "pink")
        top10SeriesButtonConfiguration.baseForegroundColor = .white
        top10SeriesButtonConfiguration.cornerStyle = .capsule
        top10SeriesButtonConfiguration.contentInsets = .init(top: 4, leading: 0, bottom: 4, trailing: 0)
        top10SeriesButtonConfiguration.baseBackgroundColor = .clear
        top10SeriesButtonConfiguration.imagePadding = 4
        var top10SeriesButtonTitleAttr = AttributedString("TOP 10 시리즈")
        top10SeriesButtonTitleAttr.font = .systemFont(ofSize: 14.0)
        top10SeriesButtonConfiguration.attributedTitle = top10SeriesButtonTitleAttr
        top10SeriesButton.configuration = top10SeriesButtonConfiguration
        
        noContentsMainDescriptionLabel.text = "이런! 찾으시는 작품이 없습니다."
        noContentsMainDescriptionLabel.textColor = .white
        noContentsMainDescriptionLabel.font = .systemFont(ofSize: 24.0, weight: .bold)
        
        noContentsSubDescriptionLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        noContentsSubDescriptionLabel.textColor = .darkGray
        noContentsSubDescriptionLabel.font = .systemFont(ofSize: 16.0)
        
        noContentsSubDescriptionContainerStackView.axis = .vertical
        noContentsSubDescriptionContainerStackView.distribution = .fillProportionally
        noContentsSubDescriptionContainerStackView.spacing = 8
        noContentsSubDescriptionContainerStackView.alignment = .center
    }
}

#Preview {
    SecondTabBarViewController()
}
