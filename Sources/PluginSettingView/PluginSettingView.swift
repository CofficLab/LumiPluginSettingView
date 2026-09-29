import KernelCore
import ProviderSettingView

/// Replaces the default settings provider with Lumi's plugin-owned settings view.
@MainActor
public final class PluginSettingView: SuperPlugin {
    public let id = "com.coffic.kuzee.plugin.setting-view"
    public let order = 3
    public let metadata = PluginMetadata(
        id: "com.coffic.kuzee.plugin.setting-view",
        name: "设置窗口",
        description: "提供设置窗口的外壳与侧边栏入口渲染。",
        category: .core,
        policy: .required
    )

    private var manager: SettingViewManager?

    public init() {}

    public func onBoot(kernel: KernelCoreContainer) throws {
        let manager = SettingViewManager()
        self.manager = manager

        // Preserve entries and selection contributed before this provider plugin boots.
        if let old = kernel.resolveProvider((any SettingViewProviding).self) {
            manager.registerEntries(old.entries)
            manager.selectEntry(id: old.selectedEntryID)
        }

        kernel.unregisterProvider((any SettingViewProviding).self)
        try kernel.registerProvider((any SettingViewProviding).self, manager)
    }

    public func onShutdown(kernel: KernelCoreContainer) throws {
        manager = nil
    }
}
