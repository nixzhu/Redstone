<p>
<a href="http://cocoadocs.org/docsets/Redstone"><img src="https://img.shields.io/cocoapods/v/Redstone.svg?style=flat"></a>
<a href="https://github.com/Carthage/Carthage/"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
</p>

# Redstone

Redstone has a State Machine.

## Requirements

Swift 4, iOS 8

(Swift 3, use version 0.3.0)

## Example

If your room has lights, you can turn it on or turn it off. If you cut the wire, it will borken.

![Lights](https://github.com/nixzhu/Redstone/raw/master/Images/lights.png)

We can define states and transitions to descripe the state machine:

``` swift
import Redstone

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
        stateMachine.add(state: .off) {
            print("Lights off")
        }
        stateMachine.add(state: .on) {
            print("Lights on")
        }
        stateMachine.add(state: .broken) {
            print("Lights broken")
        }
        stateMachine.add(transition: .turn, fromState: .off, toState: .on)
        stateMachine.add(transition: .turn, fromState: .on, toState: .off)
        stateMachine.add(transition: .cut, fromStates: [.on, .off], toState: .broken)
        return stateMachine
    }()
}
```

We create a lights, set it's initial state to off.

``` swift
let lights = Lights()
lights.stateMachine.initialState = .off
```

Now you can turn the lights from off to on, or from on to off:

``` swift
lights.stateMachine.fire(transition: .turn)
```

Or cut the wire:

``` swift
lights.stateMachine.fire(transition: .cut)
```

It will can not been turn on again.

Run the demo to feel it if you like.

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

