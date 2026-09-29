# LumiPluginSettingView

PluginSettingView 是设置视图插件：负责设置页面的外壳与侧边栏入口渲染，替换内核默认的设置 Provider。

## 功能

- macOS：`AppSettingsSidebarShell` 侧边栏 + 详情双栏布局
- iOS：紧凑宽度分层导航 / Regular 宽度双栏导航
- 保留插件启动前已注册的设置入口与选中状态

## 依赖

- [LumiKernel](https://github.com/CofficLab/LumiKernel) — `KernelCore`
- [LumiSettings](https://github.com/CofficLab/LumiSettings) — `ProviderSettingView`
- [LumiUI](https://github.com/CofficLab/LumiUI) — 设置页组件

## 使用

```swift
import PluginSettingView

// 在 Factory 中注册插件
kernel.boot(PluginSettingView())
```

## 测试

```bash
swift test
```
