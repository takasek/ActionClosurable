# ActionClosurable

[![CI Status](http://img.shields.io/travis/Yoshitaka Seki/ActionClosurable.svg?style=flat)](https://travis-ci.org/Yoshitaka Seki/ActionClosurable)
[![Version](https://img.shields.io/cocoapods/v/ActionClosurable.svg?style=flat)](http://cocoapods.org/pods/ActionClosurable)
[![License](https://img.shields.io/cocoapods/l/ActionClosurable.svg?style=flat)](http://cocoapods.org/pods/ActionClosurable)
[![Platform](https://img.shields.io/cocoapods/p/ActionClosurable.svg?style=flat)](http://cocoapods.org/pods/ActionClosurable)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Usage

ActionClosurable extends `UIControl`, `UIButton`, `UIGestureRecognizer`, `UIBarButtonItem` and `NSTimer`.
It helps writing swifty code with closure, instead of target and action like below:

```swift
let barButtonItem = UIBarButtonItem(title: "title", style: .Plain, closure: { _ in
    print("barButtonItem title")
})

button.on(.TouchDown) {
    $0.backgroundColor = UIColor.redColor()
}
button.on(.TouchUpOutside) {
    $0.backgroundColor = UIColor.whiteColor()
}
button.onTap {
    $0.enabled = false
    print($0)
}

self.gr = UITapGestureRecognizer? = UITapGestureRecognizer()
view.addGestureRecognizer(gr!)
gr?.onGesture { [weak self] in
    $0.removeTarget(nil, action: nil)
    self?.gr = nil
}

var i = 5
self.timer = NSTimer.scheduledTimerWithTimeInterval(1, repeats: true) { [weak self] timer in
    print("timer", i)
    i -= 1
    if i <= 0 {
        timer.invalidate()
        self?.timer = nil
    }
}

```

And you can extend any NSObject subclasses in very easy way. [Refer to the source.](https://github.com/takasek/ActionClosurable/blob/master/ActionClosurable/Extensions.swift)


## Installation

ActionClosurable is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ActionClosurable"
```
ActionClosurable is available through [Carthage](https://github.com/Carthage/Carthage). To install it, simply add the following line to your Cartfile:

```ruby
github "takasek/ActionClosurable"
```

## Author

[takasek](https://twitter.com/takasek)

## License

ActionClosurable is available under the MIT license. See the LICENSE file for more info.
