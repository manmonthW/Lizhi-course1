# AI全栈赋能实战训练营 - 课程大纲网站

这是一个展示AI全栈赋能实战训练营课程大纲的单页面网站。

## 部署到Vercel

### 方法一:通过Vercel CLI部署(推荐)

1. **安装Vercel CLI**(如果还没有安装)
```bash
npm install -g vercel
```

2. **登录Vercel**
```bash
vercel login
```

3. **在项目目录中运行部署命令**
```bash
cd /path/to/this/project
vercel
```

4. **按照提示操作**
   - 首次部署会询问项目配置
   - 选择"是"链接到现有项目,或创建新项目
   - 等待部署完成

5. **生产环境部署**
```bash
vercel --prod
```

### 方法二:通过GitHub + Vercel Web界面

1. **将项目推送到GitHub**
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin YOUR_GITHUB_REPO_URL
git push -u origin main
```

2. **在Vercel网站上导入项目**
   - 访问 https://vercel.com/
   - 点击"New Project"
   - 选择"Import Git Repository"
   - 选择你的GitHub仓库
   - 点击"Deploy"

### 方法三:拖拽部署

1. 访问 https://vercel.com/new
2. 直接将整个项目文件夹拖拽到页面中
3. 等待自动部署完成

## 文件结构

```
.
├── index.html        # 主页面
├── vercel.json       # Vercel配置文件
└── README.md         # 本文档
```

## 本地预览

使用任何HTTP服务器都可以本地预览,例如:

```bash
# Python 3
python -m http.server 8000

# Node.js (需要安装http-server)
npx http-server
```

然后访问 http://localhost:8000

## 技术栈

- 纯HTML + CSS
- Google Fonts (Noto Sans SC, Noto Serif SC)
- 响应式设计
- 现代浏览器优化

## 特性

- ✅ 完全响应式设计
- ✅ 优雅的动画效果
- ✅ 清晰的课程模块展示
- ✅ 部门应用场景说明
- ✅ 移动端优化

## 自定义

如需修改内容,直接编辑 `index.html` 文件即可。主要修改点:

- 课程标题和描述
- 各模块课程内容
- 部门应用场景
- 配色方案(在CSS :root 变量中定义)

## 支持的浏览器

- Chrome/Edge (最新版本)
- Firefox (最新版本)
- Safari (最新版本)
- 移动端浏览器

## License

© 2026 AI全栈赋能实战训练营
