//
//  HomeViewController.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 23/03/2022.
//

import UIKit

class HomeViewController: BaseViewController {
    
    //MARK: - UI Elements
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.delegate = self
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.dataSource = self
        return tv
    }()
    
    //MARK: - Variables
    var router: HomeScreenRouter?
    let viewModel = HomeScreenViewModel()
    var listOfRockets: [Rockets] = []
    
    //MARK: - Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
        setupController()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Overriden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        registerCell()
    }
    override func setupViews() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
    override func bindViews() {
        viewModel.fetchAllRockets { state in
            self.renderView(state: state)
        }
    }
    
    //MARK: - Functions
    private func setupController() {
        let viewController = self
        let router = HomeScreenRouter()
        router.viewController = viewController
        viewController.router = router
    }
    func setupNavigationBar() {
        self.navigationItem.title = "Space X"
        let navigationLargeFont = UIFont.normsProBold(size: 34)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: navigationLargeFont]
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    func registerCell() {
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    func renderView(state: HomeScreenViewModelStates) {
        switch state {
            case .ListOfRockets(let list):
                self.listOfRockets = list
                tableView.reloadData()
            case .Failure(let error):
            self.showSingleButtonError(title: "Error", errorText: error, errorButtonTitle: "OK")
        }
    }
}

//MARK: - UITableView Delegate & Datasource
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfRockets.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as! HomeTableViewCell
        cell.option = listOfRockets[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.router?.navigateToDetailController(withRocket: listOfRockets[indexPath.row])
    }
}

