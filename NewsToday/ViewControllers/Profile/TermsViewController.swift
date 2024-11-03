//
//  TermsViewController.swift
//  NewToday
//
//  Created by Александр Гуркин on 24.10.2024.
//

import UIKit

class TermsViewController: UIViewController {
    
    
    let contentLatin = """
Terms of Use for NewToDay Mobile App
Last updated: October 22, 2024

Please read these Terms and Conditions carefully before using our NewToDay app. By downloading and using the app, you agree to these terms. If you do not agree with them, please refrain from using the app.

1. General Terms

1.1. NewToDay is a platform that provides access to news from various sources. We enable users to read, save, and share news articles. 1.2. These Terms and Conditions govern the use of the app and any related services. 1.3. We reserve the right to modify these terms at any time. The current version will always be available in the app.

2. App Usage

2.1. License to Use. We grant you a limited, non-exclusive, non-transferable license to use the app for personal, non-commercial purposes. 2.2. Restrictions. Users are prohibited from:
* Modifying, duplicating, distributing, or creating derivative works based on the app.
* Using the app for illegal purposes or infringing on third-party rights.

3. Account

3.1. Certain app features may require creating an account. 3.2. You must provide accurate and up-to-date information during registration. 3.3. You are responsible for safeguarding your account credentials and must notify us immediately of any unauthorized access.

4. Privacy Policy

4.1. We are committed to protecting your privacy and data security. For more information on how we collect, use, and store your data, please refer to our Privacy Policy.

5. Content

5.1. All materials available in the app are provided by third-party sources and/or rights holders. 5.2. We do not take responsibility for the accuracy, completeness, or timeliness of news materials. 5.3. Users may not use app materials without permission from the rights holders.

6. Liability

6.1. The app is provided “as is.” We do not guarantee that the app will operate error-free or without interruptions. 6.2. We are not liable for:
* Any loss or damage arising from using the app.
* The content of news articles provided by third-party sources.

7. App Changes

7.1. We reserve the right to modify, suspend, or discontinue the app or individual features without prior notice.

8. Termination of Use

8.1. We may suspend or terminate your access to the app in the event of a breach of these terms.

9. Governing Law

9.1. These Terms and Conditions are governed and interpreted by the laws of the country where the company headquarters are located.

10. Contact

If you have any questions regarding these Terms and Conditions, please contact us at: support@newtoday.com.

"""
    
    let contentRus = """
Положения и условия использования мобильного приложения NewToDay
Последнее обновление: 22 октября 2024 года

Пожалуйста, внимательно прочитайте данные Положения и условия перед использованием нашего приложения NewToDay. Устанавливая и используя приложение, вы соглашаетесь с настоящими условиями. Если вы не согласны с ними, воздержитесь от использования приложения.

1. Общие положения

1.1. NewToDay — это платформа, предоставляющая доступ к новостям из различных источников. Мы предоставляем пользователям возможность читать, сохранять и делиться новостными статьями. 
1.2. Настоящие Положения и условия регулируют использование приложения и любые связанные с ним сервисы. 
1.3. Мы оставляем за собой право изменять данные условия в любое время. Актуальная версия всегда будет доступна в приложении.

2. Использование приложения

2.1. Лицензия на использование. Мы предоставляем вам ограниченную, неисключительную, непередаваемую лицензию на использование приложения в личных и некоммерческих целях.
2.2. Ограничения. Пользователям запрещается:
* Изменять, копировать, распространять или создавать производные работы на основе приложения.
* Использовать приложение для незаконных целей или нарушать права третьих лиц.

3. Учетная запись

3.1. Для доступа к определённым функциям приложения может потребоваться создание учетной записи. 
3.2. Вы обязаны предоставить точную и актуальную информацию при регистрации. 
3.3. Вы несете ответственность за сохранность данных своей учетной записи и обязаны немедленно сообщить нам о любом несанкционированном доступе.

4. Политика конфиденциальности

4.1. Мы прилагаем все усилия для защиты вашей конфиденциальности и безопасности данных. Подробнее о том, как мы собираем, используем и храним ваши данные, вы можете узнать в нашей Политике конфиденциальности.

5. Контент

5.1. Все материалы, доступные в приложении, предоставлены сторонними источниками и/или правообладателями. 
5.2. Мы не несем ответственности за точность, полноту и актуальность новостных материалов. 
5.3. Пользователь не имеет права использовать материалы приложения без разрешения правообладателей.

6. Ответственность

6.1. Приложение предоставляется "как есть". Мы не гарантируем, что приложение будет работать без ошибок или перебоев. 6.2. Мы не несем ответственности за:
* Любые потери или ущерб, возникающие в результате использования приложения.
* Содержание новостных статей, предоставленных сторонними источниками.

7. Изменения в приложении

7.1. Мы оставляем за собой право изменять, приостанавливать или прекращать работу приложения или отдельных его функций без предварительного уведомления.

8. Прекращение использования

8.1. Мы можем приостановить или прекратить ваш доступ к приложению в случае нарушения данных условий.

9. Применимое законодательство

9.1. Настоящие Положения и условия регулируются и толкуются в соответствии с законодательством страны, в которой находится головной офис компании.

10. Контакты

Если у вас есть вопросы по данным Положениям и условиям, пожалуйста, свяжитесь с нами по адресу: support@newtoday.com.
"""
    private lazy var backgroundViewColor: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var backButton: UIButton = {
        let element = UIButton()
        element.setImage(UIImage(named: "left-icon"), for: .normal)
        element.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let customBackButton = UIBarButtonItem(customView: element)
        navigationItem.leftBarButtonItem = customBackButton
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.text = Texts.TermsViewController.title
        element.tintColor = UIColor(red: 51/255, green: 54/255, blue: 71/255, alpha: 1)
        element.textAlignment = .center
        element.font = UIFont(name: "Inter-SemiBold", size: 24)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let scrollView: UIScrollView = {
        let element = UIScrollView()
        element.backgroundColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let contentView: UIView = {
        let element = UIView()
        element.backgroundColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private lazy var contentLabel: UILabel = {
        let element = UILabel()
        UserDefaults.standard.bool(forKey: "selectedLanguage")
        
        element.text = UserDefaults.standard.bool(forKey: "selectedLanguage") == true ? contentLatin : contentRus
        element.numberOfLines = 0
        element.textColor = UIColor(red: 124/255, green: 130/255, blue: 161/255, alpha: 1)
        element.textAlignment = .left
        element.font = UIFont(name: "Inter-Regular", size: 16)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = Texts.TermsViewController.title
        
        scrollView.showsVerticalScrollIndicator = false
        
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 51/255, green: 54/255, blue: 71/255, alpha: 1), NSAttributedString.Key.font: UIFont.init(name: "Inter-SemiBold", size: 24)]
    }
    
    
    private func setupViews() {
        view.addSubview(backgroundViewColor)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(contentLabel)
        
        view.addSubview(backButton)
    }
    
    private func setConstraints() {
        let scrollContentGuide = scrollView.contentLayoutGuide
        let scrollFrameGuide = scrollView.frameLayoutGuide
        NSLayoutConstraint.activate([
            backgroundViewColor.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundViewColor.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundViewColor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundViewColor.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backButton.widthAnchor.constraint(equalToConstant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor),
            
            contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }
    
}
