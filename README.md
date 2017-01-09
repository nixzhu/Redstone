<p>
<a href="http://cocoadocs.org/docsets/Redstone"><img src="https://img.shields.io/cocoapods/v/Redstone.svg?style=flat"></a>
<a href="https://github.com/Carthage/Carthage/"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
</p>

# Redstone

Redstone has a State Machine.

## Requirements

Swift 3, iOS 8

## Example

If your room has lights, you can turn it on or turn it off. If you cut the wire, it will borken.

![Lights](https://github.com/nixzhu/Redstone/raw/master/Images/lights.png)

We can define states and transitions to descripe the state machine:

``` swift
class Lights {
    enum State: Int {
        case off
        case on
        case broken
    }
    enum Transition: Int {
        case turn
        case cut
    }
    lazy var stateMachine: StateMachine<State, Transition> = {
        let stateMachine = StateMachine<State, Transition>()
        stateMachine.add(state: .off) { [weak self] in
            self?.statusBarStyle = .lightContent
            self?.view.backgroundColor = .black
            self?.promptLabel.textColor = .white
            self?.promptLabel.text = "Tap to turn lights on"
        }
        stateMachine.add(state: .on) { [weak self] in
            self?.statusBarStyle = .default
            self?.view.backgroundColor = .white
            self?.promptLabel.textColor = .black
            self?.promptLabel.text = "Tap to turn lights off"
        }
        stateMachine.add(state: .broken) { [weak self] in
            self?.statusBarStyle = .lightContent
            self?.view.backgroundColor = .black
            self?.promptLabel.textColor = .white
            self?.promptLabel.text = "The wire is broken :["
        }
        stateMachine.add(transition: .turn, fromState: .off, toState: .on)
        stateMachine.add(transition: .turn, fromState: .on, toState: .off)
        stateMachine.add(transition: .cut, fromStates: [.on, .off], toState: .broken)
        return stateMachine
    }()
}
```

You can turn the lights from off to on, or from on to off:

``` swift
stateMachine.fire(transition: .turn)
```

Or cut the wire (it will can not been turn on again):

``` swift
stateMachine.fire(transition: .cut)
```

## Installation

### Carthage

```ogdl
github "nixzhu/Redstone"
```

### CocoaPods

```ruby
pod 'Redstone'
```

## Contact

NIX [@nixzhu](https://twitter.com/nixzhu)

## License

Redstone is available under the MIT license. See the LICENSE file for more info.

