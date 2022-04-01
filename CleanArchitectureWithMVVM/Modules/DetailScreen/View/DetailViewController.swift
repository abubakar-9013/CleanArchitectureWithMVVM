//
//  DetailViewController.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 23/03/2022.
//

import UIKit

class DetailViewController: BaseViewController {
    
    //MARK:  - UI Elements
    var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 12
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: "placeHolderImage")
        return imgView
    }()
    let headingLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .normsProMedium(size: 34)
        label.textColor = .black
        return label
    }()
    let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .normsProRegular(size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1.0)
        return label
    }()
    let upcomingLaunchButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Get Upcoming Launches", for: .normal)
        btn.titleLabel?.font = .normsProMedium(size: 16)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 12
        btn.addTarget(self, action: #selector(handleUpcomingLaunch), for: .touchUpInside)
        return btn
    }()
    
    //MARK: - Variables
    let viewModel = DetailScreenViewModel()
    
    //MARK: - Initializers
    init(rocket: Rockets) {
        super.init(nibName: nil, bundle: nil)
        setupInfo(rocket: rocket)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Overriden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    override func setupViews() {
        view.addSubview(headingLabel)
        view.addSubview(imageView)
        view.addSubview(detailLabel)
        view.addSubview(upcomingLaunchButton)
        
        NSLayoutConstraint.activate([
        
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            headingLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            headingLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            
            detailLabel.leadingAnchor.constraint(equalTo: headingLabel.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            detailLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 15),
            
            upcomingLaunchButton.leadingAnchor.constraint(equalTo: detailLabel.leadingAnchor),
            upcomingLaunchButton.trailingAnchor.constraint(equalTo: detailLabel.trailingAnchor),
            upcomingLaunchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            upcomingLaunchButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    func renderViews(state: DetailScreenViewModelStates) {
        switch state {
        case .UpcomingLaunches(let launches):
            self.showSingleButtonError(title: "Launches", errorText: "There will be \(launches.count) launches in coming days. Stay Connected!", errorButtonTitle: "Wow, Ok")
        case .Failure(let error):
            self.showSingleButtonError(title: ErrorMessages.Error.rawValue, errorText: error, errorButtonTitle: ErrorMessages.OK.rawValue)
        }
    }
    
    //MARK: - Selectors
    @objc func handleUpcomingLaunch() {
        viewModel.getUpcomingLaunches { state in
            self.renderViews(state: state)
        }
    }
    
    //MARK: - Functions
    func setupInfo(rocket: Rockets) {
        self.headingLabel.text = rocket.rocketName
        self.detailLabel.text = rocket.descriptionField
        if let url = URL(string:rocket.flickrImages?[0] ?? "") {
            UIImage.loadFrom(url: url) { image in
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
    }
}
