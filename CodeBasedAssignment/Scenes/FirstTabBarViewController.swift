//
//  ViewController.swift
//  CodeBasedAssignment
//
//  Created by SUCHAN CHANG on 1/27/24.
//

import UIKit

class FirstTabBarViewController: UIViewController {
    
    // MARK: - Main Poster Properties
    let mainPosterImageView = UIImageView()
    
    let tagList = ["응원하고픈", "·", "흥미진진", "·", "사극", "·", "전투", "·", "한국 작품"]
    lazy var tagLabelList: [UILabel] = tagList.map({ tag in
        let label = UILabel()
        label.text = tag
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    })
    lazy var mainTagsContainerStackView = UIStackView(arrangedSubviews: tagLabelList)
    
    let playButton = UIButton()
    let wishListButton = UIButton()
    lazy var buttonContainterStackView = UIStackView(arrangedSubviews: [playButton, wishListButton])
    
    // MARK: - Now Trending Contents Properties
    let nowTrendingLabel = UILabel()
    
    let firstTrendingPosterImageView = UIImageView()
    let secondTrendingPosterImageView = UIImageView()
    
    let top10BadgeImageView = UIImageView()
    
    let newEpisodeLabel = UILabel()
    let watchNowLabel = UILabel()
    
    lazy var secondTrendingPosterLabelContainerStackView = UIStackView(arrangedSubviews: [newEpisodeLabel, watchNowLabel])
    
    let thirdTrendingPosterImageView = UIImageView()
    
    lazy var trendingPosterContainerStackView = UIStackView(arrangedSubviews: [firstTrendingPosterImageView, secondTrendingPosterImageView, thirdTrendingPosterImageView])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureContraints()
        configureViewController()
        configureUserEvents()
    }
}

extension FirstTabBarViewController: UIViewControllerConfigurationProtocol {
    func configureUserEvents() {
        
    }
    
    func configureNavigationBar() {
        navigationItem.title = "고래밥님"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 20.0, weight: .bold)]
    }
    
    func configureContraints() {
        [
            mainPosterImageView,
            mainTagsContainerStackView,
            buttonContainterStackView,
            nowTrendingLabel,
            trendingPosterContainerStackView,
            top10BadgeImageView,
            secondTrendingPosterLabelContainerStackView
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mainPosterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainPosterImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainPosterImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainPosterImageView.heightAnchor.constraint(equalTo: mainPosterImageView.widthAnchor, multiplier: 1.3),
            
            buttonContainterStackView.bottomAnchor.constraint(equalTo: mainPosterImageView.bottomAnchor, constant: -16),
            buttonContainterStackView.leadingAnchor.constraint(equalTo: mainPosterImageView.leadingAnchor, constant: 16),
            buttonContainterStackView.trailingAnchor.constraint(equalTo: mainPosterImageView.trailingAnchor, constant: -16),
            buttonContainterStackView.heightAnchor.constraint(equalToConstant: 40),
            
            mainTagsContainerStackView.bottomAnchor.constraint(equalTo: buttonContainterStackView.topAnchor, constant: -16),
            mainTagsContainerStackView.leadingAnchor.constraint(equalTo: buttonContainterStackView.leadingAnchor, constant: 24.0),
            mainTagsContainerStackView.trailingAnchor.constraint(equalTo: buttonContainterStackView.trailingAnchor, constant: -24.0),
            
            nowTrendingLabel.topAnchor.constraint(equalTo: mainPosterImageView.bottomAnchor, constant: 8),
            nowTrendingLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            
            trendingPosterContainerStackView.topAnchor.constraint(equalTo: nowTrendingLabel.bottomAnchor, constant: 8),
            trendingPosterContainerStackView.leadingAnchor.constraint(equalTo: mainPosterImageView.leadingAnchor, constant: -8),
            trendingPosterContainerStackView.trailingAnchor.constraint(equalTo: mainPosterImageView.trailingAnchor, constant: 8),
            
            firstTrendingPosterImageView.heightAnchor.constraint(equalTo: firstTrendingPosterImageView.widthAnchor, multiplier: 1.4),
            secondTrendingPosterImageView.heightAnchor.constraint(equalTo: secondTrendingPosterImageView.widthAnchor, multiplier: 1.4),
            thirdTrendingPosterImageView.heightAnchor.constraint(equalTo: thirdTrendingPosterImageView.widthAnchor, multiplier: 1.4),
            
            top10BadgeImageView.topAnchor.constraint(equalTo: secondTrendingPosterImageView.topAnchor),
            top10BadgeImageView.trailingAnchor.constraint(equalTo: secondTrendingPosterImageView.trailingAnchor),
            
            secondTrendingPosterLabelContainerStackView.bottomAnchor.constraint(equalTo: secondTrendingPosterImageView.bottomAnchor),
            secondTrendingPosterLabelContainerStackView.leadingAnchor.constraint(equalTo: secondTrendingPosterImageView.leadingAnchor, constant: 16),
            secondTrendingPosterLabelContainerStackView.trailingAnchor.constraint(equalTo: secondTrendingPosterImageView.trailingAnchor, constant: -16),
            
            newEpisodeLabel.heightAnchor.constraint(equalToConstant: 18),
            watchNowLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func configureViewController() {
        view.backgroundColor = .black
        
        mainPosterImageView.image = UIImage(named: "밀수")
        mainPosterImageView.contentMode = .scaleToFill
        mainPosterImageView.layer.cornerRadius = 16
        mainPosterImageView.clipsToBounds = true
        
        mainTagsContainerStackView.axis = .horizontal
        mainTagsContainerStackView.distribution = .equalSpacing
        
        var playButtonConfiguration = UIButton.Configuration.bordered()
        playButtonConfiguration.image = UIImage(systemName: "play.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        playButtonConfiguration.baseBackgroundColor = .white
        playButtonConfiguration.baseForegroundColor = .black
        playButtonConfiguration.imagePadding = 8
        var playButtonTitleAttr = AttributedString("재생")
        playButtonTitleAttr.font = .systemFont(ofSize: 14.0)
        playButtonConfiguration.attributedTitle = playButtonTitleAttr
        playButton.configuration = playButtonConfiguration
        
        var wishListButtonConfiguration = UIButton.Configuration.bordered()
        wishListButtonConfiguration.image = UIImage(systemName: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        wishListButtonConfiguration.baseBackgroundColor = .black
        wishListButtonConfiguration.baseForegroundColor = .white
        wishListButtonConfiguration.imagePadding = 8
        var wishListButtonTitleAttr = AttributedString("내가 찜한 리스트")
        wishListButtonTitleAttr.font = .systemFont(ofSize: 14.0)
        wishListButtonConfiguration.attributedTitle = wishListButtonTitleAttr
        wishListButton.configuration = wishListButtonConfiguration
        
        buttonContainterStackView.axis = .horizontal
        buttonContainterStackView.distribution = .fillEqually
        buttonContainterStackView.spacing = 8
        
        nowTrendingLabel.text = "지금 뜨는 콘텐츠"
        nowTrendingLabel.textColor = .white
        
        trendingPosterContainerStackView.axis = .horizontal
        trendingPosterContainerStackView.spacing = 8
        
        firstTrendingPosterImageView.image = UIImage(named: "범죄도시3")
        firstTrendingPosterImageView.layer.cornerRadius = 8
        firstTrendingPosterImageView.clipsToBounds = true
        
        secondTrendingPosterImageView.image = UIImage(named: "육사오")
        secondTrendingPosterImageView.layer.cornerRadius = 8
        secondTrendingPosterImageView.clipsToBounds = true
        
        thirdTrendingPosterImageView.image = UIImage(named: "서울의봄")
        thirdTrendingPosterImageView.layer.cornerRadius = 8
        thirdTrendingPosterImageView.clipsToBounds = true
        
        top10BadgeImageView.image = UIImage(named: "top10 badge")
        top10BadgeImageView.contentMode = .scaleAspectFit
        top10BadgeImageView.layer.cornerRadius = 8
        top10BadgeImageView.layer.maskedCorners = [.layerMaxXMinYCorner]
        top10BadgeImageView.layer.masksToBounds = true
    
        newEpisodeLabel.text = "새로운 에피소드"
        newEpisodeLabel.textColor = .white
        newEpisodeLabel.textAlignment = .center
        newEpisodeLabel.font = .systemFont(ofSize: 12.0, weight: .bold)
        newEpisodeLabel.backgroundColor = .red
        
        watchNowLabel.text = "지금 시청하기"
        watchNowLabel.textColor = .black
        watchNowLabel.textAlignment = .center
        watchNowLabel.font = .systemFont(ofSize: 12.0, weight: .bold)
        watchNowLabel.backgroundColor = .white
        
        secondTrendingPosterLabelContainerStackView.axis = .vertical
        secondTrendingPosterLabelContainerStackView.layer.cornerRadius = 2
        secondTrendingPosterLabelContainerStackView.clipsToBounds = true
    }
}

#Preview {
    FirstTabBarViewController()
}
