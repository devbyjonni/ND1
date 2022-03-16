//
//  MainController.swift
//  ND1
//
//  Created by Jonni Akesson on 2022-03-16.
//

import UIKit

class MainController: UIViewController {
    
    enum Section: CaseIterable {
        case main
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addNewTaskBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    
    private var tableViewDataSource: UITableViewDiffableDataSource<Section, Task>!
    private var collectionViewDataSource: UICollectionViewDiffableDataSource<Section, CalendarDate?>! = nil
    
    let viewModel = MainModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didAddData), name: .didAddData, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didAddDates), name: .didAddDates, object: nil)
        
        configureCollectionViewLayout()
        configureCollectionViewDataSource()
        configureTableViewDataSource()
        viewModel.preloadCalendarDates()
        viewModel.preloadData()
        
        //tableiew.delegate = self
    }
    
    @objc private func didAddData() {
        updateTableViewSnapshot()
    }
    
    @objc private func didAddDates() {
        updateCollectionViewSnapshot()
    }
    
    //MARK: - UITableViewDiffableDataSource
    private func configureTableViewDataSource() {
        tableViewDataSource = UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, task -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TaskCell.self)", for: indexPath) as? TaskCell else { fatalError("Could not create BookCell") }
            cell.task = task
            return cell
        }
        tableView.dataSource = tableViewDataSource
    }
    
    private func updateTableViewSnapshot(animatingDifferences: Bool = true) {
        var newSnapshot = NSDiffableDataSourceSnapshot<Section, Task>()
        newSnapshot.appendSections([Section.main])
        newSnapshot.appendItems(viewModel.data)
        tableViewDataSource.apply(newSnapshot, animatingDifferences: animatingDifferences)
    }
    
    
    //MARK: - UICollectionViewDiffableDataSource
    private func configureCollectionViewDataSource() {
        collectionViewDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView, indexPath, calendarDate) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CalendarWeekCell.self)", for: indexPath) as! CalendarWeekCell
            cell.calendarDate = calendarDate
            return cell
        }
        collectionView.dataSource = collectionViewDataSource
    }
    
    private func updateCollectionViewSnapshot(animatingDifferences: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CalendarDate?>()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(viewModel.dates)
        collectionViewDataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    private func configureCollectionViewLayout() {
        let collectionViewLayout = HorizontalCompositionalLayout(itemsPerRow: 7, contentInsets: 3)
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    //MARK: - @IBAction
    
    @IBAction func addNewTask(_ sender: UIButton) {
        print("addNewTask")
    }
    @IBAction func showEdit(_ sender: UIButton) {
        print("showEdit")
    }
    
}

//MARK: - UITableViewDelegate
extension MainController: UITableViewDelegate {
    
}

class HorizontalCompositionalLayout: UICollectionViewCompositionalLayout {
    
    init(itemsPerRow: Int, contentInsets: CGFloat = 0.0) {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / CGFloat(itemsPerRow)), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: contentInsets, leading: contentInsets, bottom: contentInsets, trailing: contentInsets)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0 )
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        super.init(section: section)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
