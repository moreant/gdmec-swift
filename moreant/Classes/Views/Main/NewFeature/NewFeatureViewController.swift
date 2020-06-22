//
//  NewFeatureViewController.swift
//  moreant
//
//  Created by admin on 2020/6/22.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SnapKit

private let reuseIdentifier = "Cell"

class NewFeatureViewController: UICollectionViewController {
    
    private let WBNewFeatureViewCellId = "WBNewFeatureViewCellId"
    
    public let WBNewFeatureImageCount = 4
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize=UIScreen.main.bounds.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        super.init(collectionViewLayout: layout)
        
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false
        
        collectionView?.showsHorizontalScrollIndicator = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(NewFeatureCell.self, forCellWithReuseIdentifier: WBNewFeatureViewCellId)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return WBNewFeatureImageCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WBNewFeatureViewCellId, for: indexPath) as! NewFeatureCell
        cell.imageIndex = indexPath.item
    
        // Configure the cell
    
        return cell
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x/scrollView.bounds.width)
        if page != WBNewFeatureImageCount - 1
        {
            return
        }
        let cell = collectionView?.cellForItem(at: IndexPath(item:page,section:0)) as! NewFeatureCell
        cell.showButtonAnim()
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

class NewFeatureCell:UICollectionViewCell
{
    public lazy var iconView:UIImageView = UIImageView()
    public lazy var startButton:UIButton = UIButton(title:"开始体验",color:UIColor.white,imageName:"new_feature_finish_button")
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupUI()
    {
        addSubview(iconView)
        addSubview(startButton)
        iconView.frame = bounds
        
        startButton.snp.makeConstraints{
            (make)->Void
            in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom).multipliedBy(0.7)
        }
        startButton.addTarget(self, action: #selector(NewFeatureCell.clickStartButton), for: .touchUpInside)
        startButton.isHidden = true
    }
    
    public var imageIndex:Int = 0
    {
        didSet{
            iconView.image = UIImage(named:"new_feature_\(imageIndex+1)")
        }
    }
    
    public func showButtonAnim()
    {
        startButton.isHidden = false
        startButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        startButton.isUserInteractionEnabled = false
        UIView.animate(withDuration: 1.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: [], animations: {()->Void in self.startButton.transform = CGAffineTransform.identity}){(_)->Void in self.startButton.isUserInteractionEnabled = true}
    }
    
    @objc
    public func clickStartButton()
    {
        print("开始体验")
    }
    
}

