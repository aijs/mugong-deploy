# TSK-20260715-003 智能树苗企业图标设计

## 目标

为木公科技网站新增一枚可复用的企业图标，并使其同时服务于导航栏品牌标记和浏览器标签页图标。

## 视觉方案

- 图标方向：智能树苗。
- 构图：圆角方形紫蓝渐变底板；白色抽象“木”形枝干；顶部居中的绿色圆形成长节点。
- 气质：教育科技、友好、成长导向，与网站现有 `#667eea → #764ba2` 渐变一致。
- 文字：图标内不加入额外文字，保证小尺寸清晰。

## 图形规格

- 画布：`120 × 120`，`viewBox="0 0 120 120"`，四周保留至少 `8` 单位安全区。
- 底板：`x=8`、`y=8`、`width=104`、`height=104`、`rx=30` 的圆角方形，使用从 `#667eea` 至 `#764ba2` 的左上至右下线性渐变。
- 枝干：使用单一路径 `M60 84V48 M60 52L38 74 M60 52L82 74`，`stroke="#ffffff"`、`stroke-width="12"`、`stroke-linecap="round"`、`stroke-linejoin="round"`、`fill="none"`。这是居中的白色抽象“木”形：竖干从 `(60,84)` 至 `(60,48)`，左右枝分别终止于 `(38,74)` 与 `(82,74)`。
- 成长节点：位于枝干正上方的 `16` 单位直径圆形，填充 `#bef264`，并以 `4` 单位白色描边隔开紫色底板。
- SVG 仅使用路径、圆形、圆角和渐变，不嵌入文字、位图或外部资源；所有边缘均须在 `16px` favicon 尺寸下保留可辨识轮廓。

## 交付物

- `assets/brand/mugong-smart-sprout.svg`：主品牌图标，透明 SVG，适合导航栏。
- `assets/brand/mugong-smart-sprout-512.png`：PNG 备用图标。
- `favicon.svg`：浏览器标签页图标，采用与主图标相同的图形和色彩。

## 网站接入

- 在 `<head>` 增加 `<link rel="icon" type="image/svg+xml" href="favicon.svg">`；使用相对路径，确保在 GitHub Pages 的 `/mugong-deploy/` 项目路径下可用。
- 用主 SVG 替换当前导航栏的“木”字渐变方块，保留“木公科技”文字与现有布局。

## 验证标准

1. SVG 与 PNG 文件可读取，且 SVG 在浅色背景上清晰。
2. 网站首页导航栏加载新图标，不改变导航高度或文字布局。
3. 浏览器可请求 `https://aijs.github.io/mugong-deploy/favicon.svg`，且返回 HTTP 200。
4. 名为 `Deploy to GitHub Pages` 的 GitHub Actions 工作流成功完成。
5. 访问 `https://aijs.github.io/mugong-deploy/` 返回 HTTP 200，HTML 同时包含 favicon 链接和 `mugong-smart-sprout.svg` 引用。

## 部署与端到端验证步骤

1. 在 `main` 分支提交图标文件与 `index.html` 变更，并执行 `git push origin main`；该推送触发 `Deploy to GitHub Pages`。
2. 使用 `curl --fail 'https://api.github.com/repos/aijs/mugong-deploy/actions/runs?event=push&branch=main&per_page=1'` 读取最新运行；验证其 `name` 为 `Deploy to GitHub Pages`、`status` 为 `completed`、`conclusion` 为 `success`。
3. 使用 `curl --fail --location https://aijs.github.io/mugong-deploy/` 下载首页；断言返回内容包含 `href="favicon.svg"` 与 `assets/brand/mugong-smart-sprout.svg`。
4. 使用 `curl --fail --location https://aijs.github.io/mugong-deploy/favicon.svg` 验证 favicon 返回 HTTP 200，并包含根 `<svg` 元素。

## 风险

- 只有全新公开提交；不修改现有文案、页面结构或域名设置。
