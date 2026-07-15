# 木公科技公司官网

## 快速部署指南（3 分钟获得公网链接）

### 步骤 1：创建 GitHub 仓库
1. 登录 [github.com](https://github.com)
2. 点击右上角 `+` → `New repository`
3. 仓库名称填写：`mugong-tech`（或其他你喜欢的名字）
4. 选择 `Public`（公开）
5. 点击 `Create repository`

### 步骤 2：上传文件
1. 在新仓库页面，点击 `uploading an existing file`
2. 把本文件夹里的所有文件（包括 `.github` 文件夹）拖拽上传
3. 点击 `Commit changes`

### 步骤 3：开启 GitHub Pages
1. 进入仓库的 `Settings`（设置）
2. 左侧菜单点击 `Pages`
3. `Source` 选择 `GitHub Actions`
4. 等待 1-2 分钟，刷新页面
5. 你会看到提示：`Your site is live at https://你的用户名.github.io/mugong-tech/`

### 完成！
你的公司网站现在已经可以通过公网链接访问了。

---

## 自定义域名（可选）

如果你想用自己的域名（如 `www.mugongtech.com`）：
1. 在仓库根目录创建 `CNAME` 文件，内容写你的域名
2. 在域名 DNS 设置中添加 CNAME 记录指向 `你的用户名.github.io`
3. 在 GitHub Pages 设置中填入你的自定义域名

## 修改内容

直接编辑 `index.html` 文件，修改文字、联系方式、备案号等，提交后网站会自动更新。