@echo off
REM Database Configuration Switcher for Windows

echo 🔄 Database Configuration Switcher
echo Choose your database provider:
echo 1. SQLite (Local) - Current
echo 2. Supabase (PostgreSQL)
echo 3. PlanetScale (MySQL)
echo 4. Railway (PostgreSQL)
echo 5. Neon (PostgreSQL)
echo 6. Custom

set /p choice="Select option (1-6): "

if "%choice%"=="1" (
    echo Setting up SQLite...
    (
        echo # Environment variables - LOCAL DATABASE
        echo DATABASE_URL="file:./dev.db"
        echo SESSION_SECRET="tImBaDIbaKoBuAtBaiKdIBalaSkoKoApAMaSalaHmu"
        echo # Password: "password" ^(simple untuk testing^)
        echo ADMIN_PASSWORD_HASH="$2a$10$bJpRHVjUw556WhjBW4RyF3OuYQz/TOSJKOEtz8Eok44NFQiW65oir6i"
        echo PORT=3000
        echo NODE_ENV=development
    ) > .env
    echo ✅ SQLite configured
) else if "%choice%"=="2" (
    set /p db_url="Enter Supabase DATABASE_URL: "
    (
        echo # Environment variables - SUPABASE
        echo DATABASE_URL="!db_url!"
        echo SESSION_SECRET="tImBaDIbaKoBuAtBaiKdIBalaSkoKoApAMaSalaHmu"
        echo ADMIN_PASSWORD_HASH="$2a$10$bJpRHVjUw556WhjBW4RyF3OuYQz/TOSJKOEtz8Eok44NFQiW65oir6i"
        echo PORT=3000
        echo NODE_ENV=production
    ) > .env
    echo ✅ Supabase configured
) else if "%choice%"=="3" (
    set /p db_url="Enter PlanetScale DATABASE_URL: "
    (
        echo # Environment variables - PLANETSCALE
        echo DATABASE_URL="!db_url!"
        echo SESSION_SECRET="tImBaDIbaKoBuAtBaiKdIBalaSkoKoApAMaSalaHmu"
        echo ADMIN_PASSWORD_HASH="$2a$10$bJpRHVjUw556WhjBW4RyF3OuYQz/TOSJKOEtz8Eok44NFQiW65oir6i"
        echo PORT=3000
        echo NODE_ENV=production
    ) > .env
    echo ✅ PlanetScale configured
) else if "%choice%"=="4" (
    set /p db_url="Enter Railway DATABASE_URL: "
    (
        echo # Environment variables - RAILWAY
        echo DATABASE_URL="!db_url!"
        echo SESSION_SECRET="tImBaDIbaKoBuAtBaiKdIBalaSkoKoApAMaSalaHmu"
        echo ADMIN_PASSWORD_HASH="$2a$10$bJpRHVjUw556WhjBW4RyF3OuYQz/TOSJKOEtz8Eok44NFQiW65oir6i"
        echo PORT=3000
        echo NODE_ENV=production
    ) > .env
    echo ✅ Railway configured
) else if "%choice%"=="5" (
    set /p db_url="Enter Neon DATABASE_URL: "
    (
        echo # Environment variables - NEON
        echo DATABASE_URL="!db_url!"
        echo SESSION_SECRET="tImBaDIbaKoBuAtBaiKdIBalaSkoKoApAMaSalaHmu"
        echo ADMIN_PASSWORD_HASH="$2a$10$bJpRHVjUw556WhjBW4RyF3OuYQz/TOSJKOEtz8Eok44NFQiW65oir6i"
        echo PORT=3000
        echo NODE_ENV=production
    ) > .env
    echo ✅ Neon configured
) else if "%choice%"=="6" (
    set /p db_url="Enter custom DATABASE_URL: "
    (
        echo # Environment variables - CUSTOM
        echo DATABASE_URL="!db_url!"
        echo SESSION_SECRET="tImBaDIbaKoBuAtBaiKdIBalaSkoKoApAMaSalaHmu"
        echo ADMIN_PASSWORD_HASH="$2a$10$bJpRHVjUw556WhjBW4RyF3OuYQz/TOSJKOEtz8Eok44NFQiW65oir6i"
        echo PORT=3000
        echo NODE_ENV=production
    ) > .env
    echo ✅ Custom database configured
) else (
    echo ❌ Invalid option
    exit /b 1
)

echo.
echo 🔧 Next steps:
echo 1. npx prisma generate
echo 2. npx prisma migrate deploy (for cloud databases)
echo 3. npm start
echo.
echo 🔍 Test connection: node debug-connection.js
