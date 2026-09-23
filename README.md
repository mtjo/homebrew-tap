# homebrew-tap

MacStroke 的个人 Homebrew tap。

```
brew tap mtjo/tap
brew install --cask mtjo/tap/macstroke
```

必须写完整的 token `mtjo/tap/macstroke`：官方 homebrew-cask 里同名的 `macstroke`
已被标记 `disable! date: "2026-09-01", because: :fails_gatekeeper_check` 并停在
2.0.5，只写 `brew install --cask macstroke` 命中的是官方那条被禁用的 cask。

## 首次打开的 Gatekeeper 提示

发布包目前是开发者本机自签名（没有 Apple Developer ID，也没做公证），所以第一次
启动 macOS 会拦一次。右键应用 →「打开」→ 再确认，或者：

```
xattr -dr com.apple.quarantine /Applications/MacStroke.app
```

换成 Developer ID 签名 + `notarytool` 公证后这个提示就没有了，届时也可以直接向
homebrew-cask 提 PR 复活官方 cask（升版本 + 换 sha256 + 去掉 `disable!`）。

## 装完后需要授权

MacStroke 要读全局鼠标事件，必须手动开辅助功能：系统设置 → 隐私与安全性 →
辅助功能 → 勾选 MacStroke，然后重启一次应用。

## 更新

软件自带 Sparkle 自动检查更新（也可以 `brew upgrade --cask mtjo/tap/macstroke`）。
两条路都会更新到最新版；用 brew 管理的话建议关掉 Sparkle 的自动下载，避免互相覆盖。

## 发版时改这里

1. 在 MacStroke 仓库跑 `./build_app.sh` + `./make_release.sh`，把 zip 传成 GitHub
   release `<版本号>` 的资源 `MacStroke.zip`。
2. `shasum -a 256` 下载回来的 `MacStroke.zip`，把结果写进
   [`Casks/macstroke.rb`](Casks/macstroke.rb) 的 `sha256`，同时改 `version`。
3. 提交推送后本地校验：

   ```
   brew update
   brew fetch --cask mtjo/tap/macstroke   # 能过说明 url/sha256 对了
   ```
