import UIKit

final class OnboardingPageController: UIPageViewController {
    var action: Callback?
    var pages = [UIViewController]()
    private let pageControl = UIPageControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        pages.append(OnboardingViewController(imageName: "photo0",
                                              titleText: "Welcome",
                                              subtitleText: "To the Swift Arcade. Your place for learning Swift."))
        pages.append(OnboardingViewController(imageName: "photo1",
                                              titleText: "Welcome",
                                              subtitleText: "To the Swift Arcade. Your place for learning Swift."))
        pages.append(OnboardingViewController(imageName: "photo2",
                                              titleText: "Welcome",
                                              subtitleText: "To the Swift Arcade. Your place for learning Swift."))
        guard let page = pages.first else { return }
        setViewControllers([page], direction: .forward, animated: false)
        setupPageControl()
    }
}

private extension OnboardingPageController {
    @objc func pageControlTapped(_ sender: UIPageControl) {
        print(sender.currentPage)
    }
}

private extension OnboardingPageController {
    func setupPageControl() {
        view.addSubview(pageControl)
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.numberOfPages = pages.count
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50)
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
            return pages.first              // wrap first
        }
    }
}

extension OnboardingPageController: UIPageViewControllerDelegate {
    
    // How we keep our pageControl in sync with viewControllers
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
}

@available(iOS 17.0, *)
#Preview {
    OnboardingPageController(transitionStyle: .scroll, navigationOrientation: .horizontal)
}
