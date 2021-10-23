
import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    var collection: UICollectionView!
    let cellId = "Cell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AlarmModel.alarms.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let secondViewController = EditViewController()
        secondViewController.index = indexPath.row
        navigationController?.pushViewController(secondViewController,animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCell
        cell.distanceLabel.text = String(AlarmModel.alarms[indexPath.row].min / 60) + ":" + String(AlarmModel.alarms[indexPath.row].min % 60)
        cell.swich.isOn = AlarmModel.alarms[indexPath.row].isActive
        cell.layer.masksToBounds = true
        cell.swich.tag = indexPath.row
        cell.swich.addTarget(self, action: #selector(alarmIsOn),  for: .valueChanged)
        return cell
    }
    
     @objc
    func alarmIsOn(_ sender: UISwitch) {
        if(sender.isOn){
            AlarmModel.alarms[sender.tag].isActive = true
        } else{
            AlarmModel.alarms[sender.tag].isActive = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(top: 5, left: 10,bottom: 0, right: 10)
        layoutFlow.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 60)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutFlow)
        view.addSubview(collection)
        collection.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collection.pin(to: view, .left, .right)
        collection.backgroundColor = .gray
        collection.dataSource = self
        collection.delegate = self
        collection.register(MyCell.self, forCellWithReuseIdentifier: cellId)
        collection.showsVerticalScrollIndicator = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.layer.masksToBounds = true
    }
    
}
