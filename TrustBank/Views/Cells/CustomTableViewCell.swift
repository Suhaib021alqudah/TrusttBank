import UIKit

class CustomTableViewCell: UITableViewCell {

    let transactionIcon = UIImageView()
    let transactiioName = UILabel()
    let transactionDate = UILabel()
    let transactionAmount = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier,

        )
        setupCellUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCellUI() {
        contentView.backgroundColor = .systemBackground

        configTransactionIcon()
        configTransactionName()
        configTransactionDate()
        configTransactionAmount()

        contentView.addSubview(transactionIcon)
        contentView.addSubview(transactiioName)
        contentView.addSubview(transactionDate)
        contentView.addSubview(transactionAmount)

        setupConstraints()
    }

    func configTransactionIcon() {
        transactionIcon.translatesAutoresizingMaskIntoConstraints = false
        transactionIcon.layer.cornerRadius = 12
        transactionIcon.clipsToBounds = true

        transactionIcon.image = UIImage(systemName: "creditcard")
        transactionIcon.tintColor = UIColor(named: "transactionIconColor")
        transactionIcon.backgroundColor = .white
        transactionIcon.layer.borderWidth = 1.0
        transactionIcon.layer.borderColor = UIColor.systemGray5.cgColor
        transactionIcon.contentMode = .center

    }

    func configTransactionName() {
        transactiioName.translatesAutoresizingMaskIntoConstraints = false
        transactiioName.font = .systemFont(ofSize: 14, weight: .bold)
        transactiioName.textColor = UIColor(named: "transactionIconColor")
    }

    func configTransactionDate() {
        transactionDate.translatesAutoresizingMaskIntoConstraints = false
        transactionDate.font = .systemFont(ofSize: 11)
        transactionDate.textColor = UIColor(named: "textgrey")
    }

    func configTransactionAmount() {
        transactionAmount.translatesAutoresizingMaskIntoConstraints = false
        transactionAmount.font = .systemFont(ofSize: 14, weight: .bold)
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([

            transactionIcon.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),

            transactionIcon.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),

            transactionIcon.widthAnchor.constraint(equalToConstant: 40),
            transactionIcon.heightAnchor.constraint(equalToConstant: 40),

            transactiioName.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 16
            ),
            transactiioName.leadingAnchor.constraint(
                equalTo: transactionIcon.trailingAnchor,
                constant: 12
            ),
            transactiioName.trailingAnchor.constraint(
                lessThanOrEqualTo: transactionAmount.leadingAnchor,
                constant: -8
            ),
            transactionDate.topAnchor.constraint(
                equalTo: transactiioName.bottomAnchor,
                constant: 4
            ),
            transactionDate.leadingAnchor.constraint(
                equalTo: transactionIcon.trailingAnchor,
                constant: 12
            ),
            transactionAmount.centerYAnchor.constraint(equalTo: centerYAnchor),
            transactionAmount.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),

        ])

    }

    func configure(with transaction: Transaction) {
        transactiioName.text = transaction.name
        transactionDate.text = transaction.createdAt
        transactionAmount.text = String(transaction.amount)

    }
}
