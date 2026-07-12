import UIKit

final class ActionItemView: UIView {

    let iconButton: ActionIconButton
    let titleLabel: ActionLabel
    let vStack = UIStackView()

    init(title: String, iconName: String) {
        self.iconButton = ActionIconButton(iconName: iconName)
        self.titleLabel = ActionLabel(title: title)
        super.init(frame: .zero)

        setupStack()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

     func setupStack() {
        translatesAutoresizingMaskIntoConstraints = false

        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.distribution = .fill
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.spacing = 8

        vStack.addArrangedSubview(iconButton)
        vStack.addArrangedSubview(titleLabel)

        addSubview(vStack)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),

            iconButton.widthAnchor.constraint(equalToConstant: 56),
            iconButton.heightAnchor.constraint(equalToConstant: 56),

        ])
    }
}
