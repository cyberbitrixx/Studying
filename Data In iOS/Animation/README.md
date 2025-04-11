## Animations in iOS Apps
### UIKit
#### 1. present(_:animated:completion:) method
``` swift
let someViewController = UIViewController()
present(someViewController, animated: true, completion: nil)
 ```
present(_:animated:completion:) method will present a view in a modal way:
* someViewController: the view controller you want to present.
* animated: if true, UIKit will animate the presentation (usually a slide-up).
* mcompletion: a closure that runs after the presentation finishes. You can use it to trigger actions right after the new screen appears.

### Alternatives
* show(_:sender:) - 
Used in navigation-based apps (like inside UINavigationController) to push view controllers.
Not modal — more for "drill down" style flows.

* pushViewController(_:animated:) - 
Used directly on a UINavigationController stack.

* SwiftUI alternative:
If you were using SwiftUI instead of UIKit, you'd use .sheet, .fullScreenCover, etc.
 <br><br>


Created by Sophie Shchukina, April 2025.
