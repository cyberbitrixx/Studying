## Basic Animations in iOS Apps
### UIKit Methods
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

## Basic UIView .animate method
Is a basic method for animating UIView objects (any objects that subclass from UIView), and can animate changes to any of these UIView properties:
| Property | What needs to be changed |
|-|-|
| Position | .frame, .center |
| Size | bounds |
| Transparency | .alpha |
| Rotation, scale, even translation | .transform |
| Bakcground color | .backgroundColor |

### Usage
For example, inside the button we want to animate once it's clicked:
``` swift
UIView.animate(withDuration: 0.3) {
 // Animation block - that's what will be animated
 myView.alpha = 0.0 // Once the button clicked and this method is executed, the button will fade away in 0.3 seconds until it's fully transparent
}
 ```
### Common method parameters
``` swift
UIView.animate(
    withDuration: 0.5,
    delay: 0.0,
    options: [.curveEaseInOut],
    animations: {
        myView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    },
    completion: { finished in
        print("Animation complete")
    }
)
 ```
| Parameter | Purpose |
|-|-|
| withDuration | how long the animation lasts |
| delay | how long to wait before starting |
| options | animations curve, repeat, autoverse, etc. (AnimationOptionsEnum) |
| animations | what to animate |
| completion | closure that runs when animation ends |

 <br><br>


Created by Sophie Shchukina, April 2025.
