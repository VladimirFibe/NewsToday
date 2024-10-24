//
//  BookMarksVC.swift
//  NewsToday
//
//  Created by Надежда Капацина on 23.10.2024.
//

import UIKit


// Mock данные
let mockArticles: [News] = [] // [
//    News(author: "Steve Holland, Andrea Shalal, Trevor Hunnicutt",
//         title: "Harris, Trump court early voters; Usher, Lizzo join campaign trail - Reuters",
//         description: "Democrat Kamala Harris and Republican Donald Trump hit the campaign trail on Saturday, pressing their case with voters from Georgia to Pennsylvania who are already starting to cast ballots in the U.S. presidential election.",
//         urlToImage: "https://www.reuters.com/resizer/v2/6VIKWAI5N5MERJGNZR6FFYFDOE.jpg?auth=50834e4d847562149d6e54127158ca0d6456905dfdb1a42f7aa031b102a74db9&height=1005&width=1920&quality=80&smart=true",
//            url: "https://www.reuter.com/world/us/harris-trump-court-early-voters-usher-lizzo-campaign-trail-2024-10-19/"),
//       ]


class BookMarksViewController: UIViewController {
    
    // MARK: - UI
    

    private let titleLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: "Inter-Bold", size: 30)

        element.textColor =  UIColor(red:0.2, green: 0.21, blue: 0.28, alpha:1)
        element.text = "Bookmarks"
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let describeLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: "Inter-Regular", size: 16)
        element.textColor = UIColor(red:0.49, green: 0.51, blue: 0.63, alpha:1)
        element.text = "Saved articles to the library"
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let bookMarksTableView = UITableView()
    
    // MARK: - Property
    
    private var news: [News] = mockArticles
    
    private let headerHeightWithNoData: CGFloat = 350
    private let headerHeightWithData: CGFloat = 0

    let identifire = "bookMarksCellid"

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()

    }
    
    
    // MARK: - SetupView
    
    func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(describeLabel)
        view.addSubview(bookMarksTableView)
        
        
        
        bookMarksTableView.delegate = self
        bookMarksTableView.register(BookMarksCell.self, forCellReuseIdentifier: identifire)
        bookMarksTableView.dataSource = self
        bookMarksTableView.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            describeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            describeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            
            bookMarksTableView.topAnchor.constraint(equalTo: describeLabel.bottomAnchor, constant: 32),
            bookMarksTableView.leadingAnchor.constraint(equalTo: describeLabel.leadingAnchor),
            bookMarksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bookMarksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                ])
        


        bookMarksTableView.tableHeaderView = createHeaderView()
    }

    private func createHeaderView() -> UIView {
        let headerView = UIView()
        
        if news.isEmpty {
            headerView.frame.size.height = headerHeightWithNoData
            
            let imageViewEllipse = UIImageView()
            imageViewEllipse.image = UIImage(named: "Ellipse")
            imageViewEllipse.translatesAutoresizingMaskIntoConstraints = false
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: "emptyStatePic")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            let label: UILabel = {
                let element = UILabel()
                element.text = "You haven't saved any articles yet. Start reading and bookmarking them now"
                element.font = UIFont(name: "Inter-Medium", size: 16)
                element.textAlignment = .center
                element.numberOfLines = 0
                element.translatesAutoresizingMaskIntoConstraints = false
                return element
            }()
            

            
            headerView.addSubview(label)
            headerView.addSubview(imageViewEllipse)
            headerView.addSubview(imageView)

            NSLayoutConstraint.activate([

                imageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                
                imageViewEllipse.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                imageViewEllipse.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                
                imageViewEllipse.widthAnchor.constraint(equalToConstant: 72),
                imageViewEllipse.heightAnchor.constraint(equalToConstant: 72),
                
                imageView.widthAnchor.constraint(equalToConstant: 24),
                imageView.heightAnchor.constraint(equalToConstant: 24),
                
                label.topAnchor.constraint(equalTo: imageViewEllipse.bottomAnchor, constant: 24),
                label.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                label.widthAnchor.constraint(equalToConstant: 256)

                
            ])
            
        } else {
            headerView.frame.size.height = headerHeightWithData
        }
        
        return headerView
    }

}
// MARK: - UiTableViewDataSource

extension BookMarksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        let news = news[indexPath.row]
         
        guard let BookMarksCell = cell as? BookMarksCell else {
             return cell
         }
        return cell
        
    }
}

 //MARK: - UiTableViewDelegate

    extension BookMarksViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
        }
    }
