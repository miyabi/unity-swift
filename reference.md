# UnitySwift Class Reference

## Class Methods

### sendMessage(target:method:message:)

#### Declaration

```swift
class func sendMessage(_ target: String!, method: String!, message: String!)
```

#### Parameters

-	*target* - The name of the GameObject on which components that has the method to call are attached.
-	*method* - The name of the method to call.
-	*message* - A string value to pass to the called method.

---

### getGLViewController()

Returns root GL view controller.

#### Declaration

```swift
class func getGLViewController() -> UIViewController!
```

#### Return Value

A UIViewController object.

---

### getGLView()

Returns GL view.

#### Declaration

```swift
class func getGLView() -> UIView!
```

#### Return Value

A UIView object.

---

### getMainWindow()

#### Declaration

```swift
class func getMainWindow() -> UIWindow!
```

#### Return Value

A UIWindow object.

---

### currentOrientation()

Returns current screen orientation.

#### Declaration

```swift
class func currentOrientation() -> ScreenOrientation
```

#### Return Value

A ScreenOrientation value.

---

### screenScaleFactor(screen:)

Returns screen scale factor for the specified screen.

#### Declaration

```swift
class func screenScaleFactor(screen: UIScreen!) -> Float
```

#### Parameters

-	*screen* - A UIScreen object to get screen scale factor.

#### Return Value

Screen scale factor.
