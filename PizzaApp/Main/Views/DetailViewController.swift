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


    // MARK: - UI Elements
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let collectionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let pizaImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "double_chicken2"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // для textStackView
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 1
        label.text = "Двойной цыплёнок"
        return label
    }()
    
    private let descriptionFirstLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryText
        label.numberOfLines = 1
        label.text = "30 см, традиционное тесто"
        return label
    }()

    private let descriptionSecondLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .secondaryText
        label.numberOfLines = 3
        label.text = "Цыплёнок, моцарелла, фирменный соус альфредо"
        return label
    }()
    // для textStackView

    // button
    private let sizeSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Маленькая", "Средняя", "Большая"])
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.backgroundColor = .systemGray6
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.setTitleTextAttributes([
            .foregroundColor: UIColor(named: "segmentedButton")!,
            .font: UIFont.systemFont(ofSize: 14, weight: .regular)
        ], for: .normal)
        segmentedControl.setTitleTextAttributes([
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 14, weight: .regular)
        ], for: .selected)
        segmentedControl.addTarget(nil, action: #selector(sizeChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    // button

    // для collectionStackView
    private let addLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 1
        label.text = "Добавить по вкусу"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // для collectionStackView

    //button
    private let addToCartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить в корзину", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "brand")!
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        button.addTarget(nil, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        return button
    }()

    private let collectionContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let addLabelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
    }

    private func setupUI() {
        navigationItem.title = "Пицца"
        navigationController?.navigationBar.prefersLargeTitles = true

        collectionView.dataSource = self
        collectionView.isScrollEnabled = false

    }

    @objc private func sizeChanged(_ sender: UISegmentedControl) {

    }

    @objc private func addToCartButtonTapped() {

    }
}

private extension DetailViewController {
    func createCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 104, height: 172)
        layout.sectionInset = .init(top: 8, left: 16, bottom: 0, right: 16)
        return layout
    }

    func setConstraints() {
        view.addSubview(scrollView)

        scrollView.addSubview(contentStackView)

        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(descriptionFirstLabel)
        textStackView.addArrangedSubview(descriptionSecondLabel)

        collectionStackView.addArrangedSubview(addLabelContainer)
        collectionStackView.addArrangedSubview(collectionContainerView)
        addLabelContainer.addSubview(addLabel)
        collectionContainerView.addSubview(collectionView)

        contentStackView.addArrangedSubview(pizaImageView)
        contentStackView.addArrangedSubview(textStackView)
        contentStackView.addArrangedSubview(sizeSegmentedControl)
        contentStackView.addArrangedSubview(collectionStackView)
        contentStackView.addArrangedSubview(addToCartButton)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentStackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16),
            contentStackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 24),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -48),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -32),

            sizeSegmentedControl.heightAnchor.constraint(equalToConstant: 44),

            addLabel.leadingAnchor.constraint(equalTo: addLabelContainer.leadingAnchor, constant: 16),
            addLabel.trailingAnchor.constraint(equalTo: addLabelContainer.trailingAnchor, constant: -16),
            addLabel.topAnchor.constraint(equalTo: addLabelContainer.topAnchor),
            addLabel.bottomAnchor.constraint(equalTo: addLabelContainer.bottomAnchor),

            collectionContainerView.heightAnchor.constraint(equalToConstant: 372),
            collectionContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            collectionView.topAnchor.constraint(equalTo: collectionContainerView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: collectionContainerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: collectionContainerView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: collectionContainerView.bottomAnchor),

            addToCartButton.heightAnchor.constraint(equalToConstant: 56),
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




