//
//  CategoryVC.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 15/04/25.
//

import UIKit

class CategoryVC: UIViewController {

    @IBOutlet weak var tbleCategory: UITableView!
    
    var categoryModel: CategoryModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tbleCategory.register(UINib(nibName: "CategoryTVC", bundle: nil), forCellReuseIdentifier: "CategoryTVC")
        CategoryAPICall()
    }
    func CategoryAPICall() {
            
            APIManager.shared.api_request(
                task: Constant.API.categoryAPI.rawValue,
                headers: nil,
                param: nil
            ) { (success: SuccessReponse<CategoryModel>?, failure) in
                if let user = success?.data {
                    DispatchQueue.main.async {
                        self.categoryModel = user
                        self.tbleCategory.reloadData()
                    }
                   print(user)
                } else if let error = failure {
                    print("API Error: \(error.message ?? "Data is not getting")")
                    // Show error to user
                }
            }
        }
}
extension CategoryVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryModel?.categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTVC") as? CategoryTVC else {
            return UITableViewCell()
        }
        cell.lblCategoryName.text = categoryModel?.categories?[indexPath.row].category_name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
