//
//  BookMarksVC.swift
//  NewsToday
//
//  Created by Надежда Капацина on 23.10.2024.
//

import UIKit


// Mock данные
let mockArticles: [News] =  [
    News(sourse: Sourse(id: "reuters",
                        name: "Reuters"),
         author: "Steve Holland, Andrea Shalal, Trevor Hunnicutt",
         title: "Harris, Trump court early voters; Usher, Lizzo join campaign trail - Reuters",
         description: nil,
        urlToImage: "1",
         url: nil),
    News(sourse: Sourse(id: "cnn",
                        name: "CNN"),
         author: "Edward Szekeres, Simone McCarthy, Sophie Tanno, Rosa Rahimi, Tori B. Powell",
         title: "The latest on Hamas leader’s death and war in the Middle East - CNN",
         description: nil,
         urlToImage: "2",
         url:nil),
    News(sourse: Sourse(id: nil,
                        name: "Yahoo Entertainment"),
         author: "Liz Kocan",
         title: "Ngannou vs. Ferreira: How to watch the PFL Battle of the Giants tonight, full fight card and more - Yahoo Sports",
         description: nil,
         urlToImage: "3",
         url:nil),
      ]


class BookMarksViewController: UIViewController {
    
    // MARK: - UI
    

    private let titleLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: "Inter-Bold", size: 30)

        element.textColor =  .blackPrimary
        element.text = "Bookmarks"
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let describeLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: "Inter-Regular", size: 16)
        element.textColor = .greyPrimary
        element.text = "Saved articles to the library"
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let bookMarksTableView = UITableView()
    
    // MARK: - Property
    
    private var news: [News] = mockArticles
    
    private let headerHeightWithNoData: CGFloat = 350
    private let headerHeightWithData: CGFloat = 0


    
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
        bookMarksTableView.register(BookMarksCell.self, forCellReuseIdentifier: BookMarksCell.identifire)
        bookMarksTableView.dataSource = self
        bookMarksTableView.translatesAutoresizingMaskIntoConstraints = false
        bookMarksTableView.separatorStyle = .none



        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            describeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            describeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            
            bookMarksTableView.topAnchor.constraint(equalTo: describeLabel.bottomAnchor, constant: 32),
            bookMarksTableView.leadingAnchor.constraint(equalTo: describeLabel.leadingAnchor),
            bookMarksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            bookMarksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                ])
        


        bookMarksTableView.tableHeaderView = createHeaderView()
    }

    // MARK: - createHeaderView
    
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let text = news[indexPath.row].title
          let width = tableView.frame.width
          let size = CGSize(width: width, height: .greatestFiniteMagnitude)
        
          let minHeight: CGFloat = 70
          let estimatedHeight = (text! as NSString).boundingRect(with: size,
                                                                options: .usesLineFragmentOrigin,
                                                                attributes: [.font: UIFont.systemFont(ofSize: 16)],
                                                                context: nil).height
          
        return max(estimatedHeight + 80, minHeight)
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookMarksCell.identifire, for: indexPath) as! BookMarksCell
        cell.configure(with: news[indexPath.row])
        return cell
        
    }
}

 //MARK: - UiTableViewDelegate

    extension BookMarksViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
        }
    }
