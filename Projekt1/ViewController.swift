import SnapKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }

    private let viewModel: ViewModelContract

    init(viewModel: ViewModelContract) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
        view.addSubview(buttonThree)
        view.addSubview(buttonFour)
        view.addSubview(buttonFive)
        view.addSubview(label)
        self.view.backgroundColor = .white
    }

    private func setupConstraints() {
        buttonOne.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }

        buttonTwo.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(buttonOne.snp.bottom).offset(50)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }

        buttonThree.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(buttonTwo.snp.bottom).offset(50)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }

        buttonFour.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(buttonThree.snp.bottom).offset(50)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }

        buttonFive.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(buttonFour.snp.bottom).offset(50)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }

        label.snp.makeConstraints { make -> Void in
            make.left.equalTo(buttonOne.snp.right).offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.width.equalTo(230)
            make.height.equalTo(400)
        }
    }

    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .systemGray5
        label.textAlignment = .center
        return label
    }()

    private let buttonOne: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitle("First Endpoint", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(buttonOneTap), for: .touchUpInside)
        return button
    }()

    private let buttonTwo: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitle("Second Endpoint", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(buttonTwoTap), for: .touchUpInside)
        return button
    }()

    private let buttonThree: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitle("Third Endpoint", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(buttonThreeTap), for: .touchUpInside)
        return button
    }()

    private let buttonFour: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitle("Forth Endpoint", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(buttonFourTap), for: .touchUpInside)
        return button
    }()

    private let buttonFive: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitle("Fifth Endpoint", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(buttonFiveTap), for: .touchUpInside)
        return button
    }()

    @objc
    private func buttonOneTap() {
        async {
            label.text =  await viewModel.buttonOneTap()
        }
    }

    @objc
    private func buttonTwoTap() {
        async {
            label.text =  await viewModel.buttonTwoTap()
        }
    }

    @objc
    private func buttonThreeTap() {
        async {
            label.text =  await viewModel.buttonThreeTap()
        }
    }

    @objc
    private func buttonFourTap() {
        async {
            label.text =  await viewModel.buttonFourTap()
        }
    }

    @objc
    private func buttonFiveTap() {
        async {
            label.text =  await viewModel.buttonFiveTap()
        }
    }

}
