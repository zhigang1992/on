# on
Swift implementation on jQuery like event API

Ever get tired of writting add target action selector???

try this.

```swift
button.on(.TouchUpInside) { (button, event) in
  print("This is much cooler than adding a target action")
}

textField.on(.EditingChanged) { _ in
  print("Works on all UIControls")
}
```
