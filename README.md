# HybridUIKitSwiftUIDemo

A working iOS demo that shows how to combine **SwiftUI** and **UIKit** in a hybrid architecture using shared state and view models. Perfect for learning how to gradually adopt SwiftUI in existing UIKit projects.

## 🔥 What This Project Shows

- Using **SwiftUI views inside UIKit** with `UIHostingController`
- Navigating from UIKit to SwiftUI seamlessly
- Sharing state using `@ObservableObject` and `@Published`
- Bidirectional communication between UIKit and SwiftUI
- MVVM design pattern for clean separation of concerns
- SceneDelegate-based launch (no storyboard)

---

## 🧱 Architecture

This demo follows a **hybrid MVVM architecture**:

- **UIKit** handles navigation and existing view controllers
- **SwiftUI** powers new views that are simple and self-contained
- **CounterViewModel** (ObservableObject) is shared between both
- UI updates in one layer are reflected in the other instantly

---

## 🗂 File Overview

| File                  | Purpose                                      |
|-----------------------|----------------------------------------------|
| `AppDelegate.swift`   | Entry point of the app                       |
| `SceneDelegate.swift` | Manages window and root view controller      |
| `ViewController.swift`| UIKit screen with counter and SwiftUI button |
| `CounterView.swift`   | SwiftUI view using the same shared state     |
| `CounterViewModel.swift` | Shared ViewModel using Combine            |

---

## ✅ Requirements

- Xcode 14 or newer
- iOS 13+
- No storyboard required

---

## 📚 Resources

- [UIHostingController - Apple Docs](https://developer.apple.com/documentation/swiftui/uihostingcontroller)
- [UIViewRepresentable - Apple Docs](https://developer.apple.com/documentation/swiftui/uiviewrepresentable)
- [SwiftUI Overview](https://developer.apple.com/documentation/swiftui)

---

## 📥 Clone This Repo

To clone this project locally:

```bash
git clone https://github.com/himalidev/HybridUIKitSwiftUIDemo.git
cd HybridUIKitSwiftUIDemo
open HybridUIKitSwiftUIDemo.xcodeproj
```

---

## 🧑‍💻 Author

Created by **Himali Marasinghe**  

---


