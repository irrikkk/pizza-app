import UIKit

class DetailViewController: UIViewController {

    let ingredientsArray = [
        IngredientsData(image: UIImage(named: "cheese_side"), text: "Сырный бортик", price: "179 ₽"),
        IngredientsData(image: UIImage(named: "shrimps"), text: "Креветки", price: "199 ₽"),
        IngredientsData(image: UIImage(named: "mozzarella"), text: "Сливочная моцарелла", price: "79 ₽"),
        IngredientsData(image: UIImage(named: "cheddar_and_parmesan_cheeses"), text: "Сыры чеддер и пармезан", price: "79 ₽"),
        IngredientsData(image: UIImage(named: "pepper"), text: "Острый перец халапеньо", price: "59 ₽"),
        IngredientsData(image: UIImage(named: "chicken"), text: "Нежный цыпленок", price: "79 ₽"),
    ]

    // MARK: - Properties
    var pizza: MainData?

    // MARK: - CollectionView
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())
        collection.register(IngredientsCollectionViewCell.self,
                            forCellWithReuseIdentifier: IngredientsCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false

        collection.backgroundColor = .systemBackground

        return collection
    }()


    //    // MARK: - UI Elements
    //    private let scrollView: UIScrollView = {
    //        let scrollView = UIScrollView()
    //        scrollView.translatesAutoresizingMaskIntoConstraints = false
    //        return scrollView
    //    }()
    //
    //    private let contentStackView: UIStackView = {
    //        let stackView = UIStackView()
    //        stackView.axis = .vertical
    //        stackView.spacing = 16
    //        stackView.alignment = .fill
    //        stackView.distribution = .fill
    //        stackView.translatesAutoresizingMaskIntoConstraints = false
    //        return stackView
    //    }()
    //
    //    private let textStackView: UIStackView = {
    //        let stackView = UIStackView()
    //        stackView.axis = .vertical
    //        stackView.spacing = 8
    //        stackView.alignment = .fill
    //        stackView.distribution = .fill
    //        stackView.translatesAutoresizingMaskIntoConstraints = false
    //        return stackView
    //    }()
    //
    //    private let pizaImageView: UIImageView = {
    //        let imageView = UIImageView()
    //        imageView.contentMode = .scaleAspectFill
    //        imageView.clipsToBounds = true
    //        return imageView
    //    }()
    //
    //    // для textStackView
    //    private let titleLabel: UILabel = {
    //        let label = UILabel()
    //        label.font = .systemFont(ofSize: 24, weight: .bold)
    //        label.textColor = .label
    //        label.numberOfLines = 1
    //        return label
    //    }()
    //
    //    private let descriptionFirstLabel: UILabel = {
    //        let label = UILabel()
    //        label.font = .systemFont(ofSize: 14, weight: .regular)
    //        label.textColor = .secondaryText
    //        label.numberOfLines = 1
    //        return label
    //    }()
    //
    //    private let descriptionSecondLabel: UILabel = {
    //        let label = UILabel()
    //        label.font = .systemFont(ofSize: 16, weight: .regular)
    //        label.textColor = .secondaryText
    //        label.numberOfLines = 3
    //        return label
    //    }()
    //    // для textStackView

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Пицца"
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.dataSource = self
        setConstraints()
    }
}

private extension DetailViewController {
    func createCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 113, height: 172)
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }

    func setConstraints() {
        // collectionView
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ingredientsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientsCollectionViewCell.identifier,
            for: indexPath) as? IngredientsCollectionViewCell
            else {
                return UICollectionViewCell()
            }
        let ingredientsData = ingredientsArray[indexPath.row]

        cell.set(ingredientsData: ingredientsData)

        return cell
    }
}




