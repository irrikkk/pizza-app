import UIKit

class IngredientsCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = String(describing: IngredientsCollectionViewCell.self)

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let labelView: UILabel = {
        let labelView = UILabel()
        labelView.font = .systemFont(ofSize: 12, weight: .regular)
        labelView.textColor = .label
        labelView.textAlignment = .center
        labelView.numberOfLines = 2
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()

    private let priceLabelView: UILabel = {
        let labelView = UILabel()
        labelView.font = .systemFont(ofSize: 14, weight: .medium)
        labelView.textColor = .label
        labelView.textAlignment = .center
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()

    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            imageView,
            labelView,
            priceLabelView
        ])

        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill

        return stackView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCellView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set (ingredientsData: IngredientsData) {
        imageView.image = ingredientsData.image
        labelView.text = ingredientsData.text
        priceLabelView.text = ingredientsData.price
    }

}

private extension IngredientsCollectionViewCell {
    func setConstraints() {
        contentView.addSubview(vStackView)

        let margins = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            vStackView.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            vStackView.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            vStackView.widthAnchor.constraint(equalTo: margins.widthAnchor),
            vStackView.heightAnchor.constraint(equalTo: margins.heightAnchor),

            imageView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.5),
        ])
    }

    func configureCellView() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 16

        layer.shadowOffset = .init(width: 0, height: 0)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 8
    }
}
