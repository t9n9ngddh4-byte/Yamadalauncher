import UIKit

let yamada1 = "jp.co.unisys.yamadamobile.41599"
let yamada2 = "jp.co.unisys.yamadamobile.88201"

func openApp(_ bundleID: String) {
    if let workspaceClass = NSClassFromString("LSApplicationWorkspace") as? NSObject.Type,
       let workspace = workspaceClass.perform(
            NSSelectorFromString("defaultWorkspace")
       )?.takeUnretainedValue() as? NSObject {

        let selector = NSSelectorFromString("openApplicationWithBundleID:")

        if workspace.responds(to: selector) {
            workspace.perform(selector, with: bundleID)
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        let title = UILabel()
        title.text = "YAMADA"
        title.font = .boldSystemFont(ofSize: 30)
        title.textAlignment = .center

        let button1 = UIButton(type: .system)
        button1.setTitle("Yamada 1", for: .normal)
        button1.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button1.addAction(
            UIAction { _ in openApp(yamada1) },
            for: .touchUpInside
        )

        let button2 = UIButton(type: .system)
        button2.setTitle("Yamada 2", for: .normal)
        button2.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button2.addAction(
            UIAction { _ in openApp(yamada2) },
            for: .touchUpInside
        )

        let stack = UIStackView(
            arrangedSubviews: [title, button1, button2]
        )

        stack.axis = .vertical
        stack.spacing = 25
        stack.alignment = .fill

        view.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            stack.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            stack.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 40
            ),
            stack.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -40
            )
        ])
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()

        self.window = window

        return true
    }
}

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    NSStringFromClass(AppDelegate.self)
)
