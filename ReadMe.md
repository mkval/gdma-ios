## Getting Started

| Summary                    |                |
|:---------------------------|:---------------|
| Target Device              | **iPhone**     |
| Minimum Deployment Target: | **iOS 17.0**   |
| Swift Language             | **5.0**        |
| Architecture               | **MVVM**       |
| UI Framework               | **SwiftUI**    |
| Dep. Manager               | **SPM**        |



## SwiftGen

We use [SwiftGen](https://github.com/SwiftGen/SwiftGen) to generate Swift code for our resources such as images, colors, strings, and fonts. 

Note that you can only access the newly added resources after building the project. 

These are the generated files (`Guidomia/Generated/*`):
 
- Assets+Generated.swift
- Strings+Generated.swift
- Fonts+Generated.swift

Since the files above are already tracked, we no longer need to add the SwiftGen Package. 
