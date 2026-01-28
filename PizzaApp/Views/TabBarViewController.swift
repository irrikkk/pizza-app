import UIKit

class TabBarViewController: UITabBarController {
    let pizzaImage = UIImage(named: "pizza")
    let ordersImage = UIImage(named: "orders")
    let cartImage = UIImage(named: "cart")
    let profileImage = UIImage(named: "profile")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupTabBarAppearance()
    }

    private func setupViewControllers() {
        let mainVC = MainViewController()
        let ordersVC = OrdersViewController()
        let cartVC = CartViewController()
        let profileVC = ProfileViewController()

        let mainNav = UINavigationController(rootViewController: mainVC)
        let ordersNav = UINavigationController(rootViewController: ordersVC)
        let cartNav = UINavigationController(rootViewController: cartVC)
        let profileNav = UINavigationController(rootViewController: profileVC)

        mainNav.tabBarItem = UITabBarItem(
            title: "Пицца",
            image: pizzaImage,
            selectedImage: pizzaImage)

        ordersNav.tabBarItem = UITabBarItem(
            title: "Заказы",
            image: ordersImage,
            selectedImage: ordersImage)

        cartNav.tabBarItem = UITabBarItem(
            title: "Корзина",
            image: cartImage,
            selectedImage: cartImage)

        profileNav.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: profileImage,
            selectedImage: profileImage)

        setViewControllers(
            [mainNav, ordersNav, cartNav, profileNav],
            animated: true)
    }

    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .systemBackground

        tabBar.standardAppearance = appearance

        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }

        tabBar.tintColor = UIColor(named: "brand")
        tabBar.unselectedItemTintColor = .secondaryLabel

    }
}
