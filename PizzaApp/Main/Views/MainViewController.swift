import UIKit

class MainViewController: UIViewController {

    let dataArray = [
        MainData(image: UIImage(named: "pepperoni"), title: "Пепперони", description: "Пикантаная пепперони, увеличенная порция моцареллы, фирменный томатный соус", price: "от 299 ₽"),
        MainData(image: UIImage(named: "cheese"), title: "Сырная", description: "Моцарелла, сыры чеддер и пармезан, фирменный соус альфредо", price: "от 289 ₽"),
        MainData(image: UIImage(named: "double_chicken"), title: "Двойной цыплёнок", description: "Цыплёнок, моцарелла, фирменный соус альфредо", price: "от 389 ₽"),
        MainData(image: UIImage(named: "ham_and_cheese"), title: "Ветчина и сыр", description: "Ветчина, моцарелла, фирменный соус альфредо", price: "от 389 ₽"),
    ]

    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView

    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setConstraints()

        navigationItem.title = "Пицца"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.dataSource = self
    }
}

private extension MainViewController {
    func setConstraints() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainTableViewCell.identifier,
            for: indexPath
        ) as? MainTableViewCell else {
            return UITableViewCell()
        }

        let pizza = dataArray[indexPath.row]

        cell.configure(with: pizza)

        return cell
    }
    

}

