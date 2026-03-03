@echo off
echo 🚀 开始部署到Vercel...
echo.

REM 检查是否安装了Vercel CLI
where vercel >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Vercel CLI未安装
    echo 📦 正在安装Vercel CLI...
    npm install -g vercel
    echo ✅ Vercel CLI安装完成
)

echo 🔐 请登录Vercel账号...
vercel login

echo.
echo 📤 开始部署项目...
vercel --prod

echo.
echo ✨ 部署完成!
echo 🌐 你的网站已经上线了!
pause
