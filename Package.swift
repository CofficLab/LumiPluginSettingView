// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "LumiPluginSettingView",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(name: "PluginSettingView", targets: ["PluginSettingView"]),
    ],
    dependencies: [
        .package(url: "https://github.com/CofficLab/LumiKernel.git", from: "1.0.0"),
        .package(url: "https://github.com/CofficLab/LumiSettings.git", from: "1.0.1"),
        .package(url: "https://github.com/CofficLab/LumiUI.git", from: "1.7.0"),
    ],
    targets: [
        .target(
            name: "PluginSettingView",
            dependencies: [
                .product(name: "KernelCore", package: "LumiKernel"),
                .product(name: "ProviderSettingView", package: "LumiSettings"),
                .product(name: "LumiUI", package: "LumiUI"),
            ]
        ),
        .testTarget(
            name: "PluginSettingViewTests",
            dependencies: [
                "PluginSettingView",
                .product(name: "KernelCore", package: "LumiKernel"),
                .product(name: "ProviderSettingView", package: "LumiSettings"),
            ]
        ),
    ]
)
