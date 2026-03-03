# 详细部署指南 - 将网站部署到Vercel

本指南提供三种部署方式,选择最适合你的方法。

---

## 🎯 方法一:使用部署脚本(最简单)

### Mac/Linux用户

```bash
# 在项目目录中运行
./deploy.sh
```

### Windows用户

```bash
# 双击运行
deploy.bat
```

脚本会自动:
1. 检查并安装Vercel CLI(如果需要)
2. 提示你登录Vercel账号
3. 自动部署项目到生产环境

---

## 🔧 方法二:手动使用Vercel CLI

### 第一步:安装Vercel CLI

```bash
npm install -g vercel
```

或者使用yarn:
```bash
yarn global add vercel
```

### 第二步:登录Vercel

```bash
vercel login
```

会打开浏览器让你登录,选择登录方式:
- GitHub
- GitLab
- Bitbucket
- Email

### 第三步:初始化项目

在项目目录中运行:
```bash
vercel
```

首次部署会询问:
```
? Set up and deploy "~/your-project"? [Y/n]
? Which scope do you want to deploy to? Your Name
? Link to existing project? [y/N]
? What's your project's name? ai-training-course
? In which directory is your code located? ./
```

选择建议:
- ✅ 确认部署
- ✅ 选择你的账号
- ❌ 不链接现有项目(除非你已经有了)
- ✏️ 输入项目名称
- ✅ 代码在当前目录

### 第四步:生产环境部署

测试通过后,部署到生产环境:
```bash
vercel --prod
```

成功后会显示:
```
✅  Production: https://your-project.vercel.app [复制]
📝  Deployed to production. Run `vercel --prod` to overwrite later.
```

---

## 🌐 方法三:通过GitHub自动部署(推荐用于团队)

### 第一步:创建GitHub仓库

1. 访问 https://github.com/new
2. 创建一个新仓库(公开或私有都可以)
3. 不要初始化README、.gitignore或license

### 第二步:推送代码到GitHub

```bash
# 初始化git仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: AI课程大纲网站"

# 关联远程仓库(替换成你的仓库地址)
git remote add origin https://github.com/your-username/your-repo.git

# 推送到GitHub
git branch -M main
git push -u origin main
```

### 第三步:在Vercel中导入项目

1. 访问 https://vercel.com/
2. 点击右上角 **"Add New..." → "Project"**
3. 点击 **"Import Git Repository"**
4. 选择你刚创建的GitHub仓库
5. 配置项目:
   - **Project Name**: 自动填充或自定义
   - **Framework Preset**: Other (自动检测为静态网站)
   - **Build Command**: 留空
   - **Output Directory**: 留空
6. 点击 **"Deploy"**

### 第四步:自动部署设置

✅ **现在每次推送到GitHub,Vercel会自动部署!**

```bash
# 修改代码后
git add .
git commit -m "更新课程内容"
git push

# Vercel会自动检测并部署新版本
```

---

## 🎨 方法四:拖拽部署(最快速)

### 适合场景
- 快速测试
- 不需要Git管理
- 一次性部署

### 步骤

1. **准备文件**
   - 将所有文件放在一个文件夹中
   - 确保包含 `index.html` 和 `vercel.json`

2. **访问Vercel**
   - 打开 https://vercel.com/new
   
3. **拖拽文件夹**
   - 直接把文件夹拖到页面中
   - 或者点击 "Browse" 选择文件夹

4. **等待部署**
   - Vercel会自动检测文件
   - 几秒钟后完成部署
   - 获得一个 `.vercel.app` 域名

---

## 🔗 自定义域名

部署成功后,你可以绑定自己的域名。

### 步骤

1. 在Vercel项目页面,点击 **"Settings"**
2. 选择 **"Domains"**
3. 输入你的域名,例如: `ai-training.com`
4. 按照提示配置DNS记录:
   - **A记录**: 指向 Vercel 的 IP
   - **CNAME**: 指向 `cname.vercel-dns.com`
5. 等待DNS传播(通常几分钟到48小时)

### 常见域名服务商配置

#### 阿里云
```
类型: CNAME
主机记录: @
记录值: cname.vercel-dns.com
TTL: 600
```

#### 腾讯云
```
记录类型: CNAME
主机记录: @
记录值: cname.vercel-dns.com
TTL: 10分钟
```

#### GoDaddy
```
Type: CNAME
Name: @
Value: cname.vercel-dns.com
TTL: 1 Hour
```

---

## 🛠️ 环境变量配置(如果需要)

虽然这是静态网站,但如果将来需要环境变量:

1. 在Vercel项目设置中,选择 **"Environment Variables"**
2. 添加变量:
   - **Key**: 变量名
   - **Value**: 变量值
   - **Environment**: Production / Preview / Development
3. 重新部署使变量生效

---

## 🚀 性能优化建议

### 1. 启用自动压缩
Vercel默认启用Gzip和Brotli压缩,无需额外配置。

### 2. 图片优化
如果添加图片,考虑使用Vercel的图片优化:

```html
<!-- 使用Vercel Image Optimization -->
<img src="/_next/image?url=/path/to/image.jpg&w=800&q=75" alt="描述">
```

### 3. 缓存策略
在 `vercel.json` 中添加:

```json
{
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "Cache-Control",
          "value": "public, max-age=31536000, immutable"
        }
      ]
    }
  ]
}
```

---

## 📊 查看部署状态和分析

### 部署日志
1. 访问项目的Vercel仪表板
2. 选择 **"Deployments"**
3. 点击任何部署查看详细日志

### 访问分析
1. 在项目设置中启用 **Analytics**
2. 查看:
   - 页面访问量
   - 用户地理位置
   - 性能指标
   - 实时访客

---

## ❓ 常见问题

### Q: 部署后看不到更新?
**A:** 清除浏览器缓存或使用隐私模式访问。

### Q: 自定义域名不生效?
**A:** 检查DNS配置,可能需要等待DNS传播(最多48小时)。

### Q: 如何回滚到之前的版本?
**A:** 
```bash
# 在Vercel仪表板中
1. 进入 Deployments
2. 找到要回滚的版本
3. 点击 "..." → "Promote to Production"
```

### Q: 部署失败怎么办?
**A:** 检查:
- `index.html` 文件是否存在
- 文件编码是否为UTF-8
- vercel.json语法是否正确
- 查看部署日志中的错误信息

### Q: 如何删除项目?
**A:**
```bash
# 方法1: 使用CLI
vercel remove project-name

# 方法2: 在网页端
Settings → Advanced → Delete Project
```

### Q: 收费吗?
**A:** Vercel的Hobby计划免费,包括:
- ✅ 无限部署
- ✅ 100GB带宽/月
- ✅ 自动HTTPS
- ✅ 自定义域名
- ✅ 预览部署

---

## 🎉 部署成功后

你的网站现在已经上线了!你可以:

1. **分享链接**: `https://your-project.vercel.app`
2. **监控性能**: 在Vercel仪表板查看分析数据
3. **持续更新**: 每次推送代码自动部署
4. **添加功能**: 随时可以添加新的页面或功能

---

## 📞 获取帮助

- **Vercel文档**: https://vercel.com/docs
- **Vercel社区**: https://github.com/vercel/vercel/discussions
- **技术支持**: support@vercel.com

---

祝部署顺利! 🚀
