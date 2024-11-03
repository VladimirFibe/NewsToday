import UIKit

final class OnboardingPageController: UIPageViewController {
    var action: Callback?
    var pages = [UIViewController]()
    private let pageControl = UIPageControl()
    private let actionButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        view.backgroundColor = .systemBackground
        pages.append(OnboardingViewController(imageName: "photo0",
                                              titleText: "First to know",
                                              subtitleText: "Catch the latest news from around the world, curated just for you."))
        pages.append(OnboardingViewController(imageName: "photo1",
                                              titleText: "Personalize your feed",
                                              subtitleText: "Choose your favorite categories to see what matters most to you."))
        pages.append(OnboardingViewController(imageName: "photo2",
                                              titleText: "Save & Share",
                                              subtitleText: "Bookmark articles and share them with friends in just one tap."))
        setupPageControl()
        setupActionButton()
    }
    
    func setCurrentPage(index: Int) {
        let isForward = NewsDefaults.currentPage < index
        pageControl.currentPage = index
        NewsDefaults.currentPage = index
        actionButton.setNeedsUpdateConfiguration()
        setViewControllers(
            [pages[pageControl.currentPage]],
            direction: isForward ? .forward : .reverse,
            animated: true
        )
    }
}

@objc private extension OnboardingPageController {
    func pageControlTapped(_ sender: UIPageControl) {
        setCurrentPage(index: sender.currentPage)
    }
    
    func actionButtonTapped() {
        if pageControl.currentPage < pages.count - 1 {
            setCurrentPage(index: pageControl.currentPage + 1)
        } else {
            action?()
        }
    }
}

private extension OnboardingPageController {
    func setupPageControl() {
        view.addSubview(pageControl)
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.numberOfPages = pages.count
        setCurrentPage(index: NewsDefaults.currentPage)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50)
        ])
    }
    
    func setupActionButton() {
        view.addSubview(actionButton)
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = UIColor(named: "brandPurple")
        
        let font = UIFont(name: "Inter-SemiBold", size: 16) ?? .systemFont(ofSize: 16)
        config.attributedTitle = AttributedString("Next", attributes: AttributeContainer([.font: font]))

        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.layer.cornerRadius = 12
        actionButton.configuration = config
        
        actionButton.configurationUpdateHandler = { [weak self] button in
            guard let self else { return }
            var configuration = button.configuration
            let title = self.pageControl.currentPage < 2 ? "Next" : "Get Started"
            configuration?.attributedTitle = AttributedString(title, attributes: AttributeContainer([.font: font]))
            button.configuration = configuration
        }
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .primaryActionTriggered)
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 56)

        ])
    }
}

extension OnboardingPageController: UIPageViewControllerDataSource {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {

        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last               // wrap last
        } else {
            return pages[currentIndex - 1]  // go previous
        }
    }
        
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }

        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // go next
        } else {
            action?()
            return pages.first              // wrap first
        }
    }
}

extension OnboardingPageController: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        guard let viewControllers = pageViewController.viewControllers,
                let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        setCurrentPage(index: currentIndex)
    }
}

@available(iOS 17.0, *)
#Preview {
    OnboardingPageController(transitionStyle: .scroll, navigationOrientation: .horizontal)
}
