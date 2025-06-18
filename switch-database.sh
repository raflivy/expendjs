#!/bin/bash

# Database Configuration Switcher

echo "🔄 Database Configuration Switcher"
echo "Choose your database provider:"
echo "1. SQLite (Local) - Current"
echo "2. Supabase (PostgreSQL)"
echo "3. PlanetScale (MySQL)"
echo "4. Railway (PostgreSQL)"
echo "5. Neon (PostgreSQL)"
echo "6. Custom"

read -p "Select option (1-6): " choice

case $choice in
    1)
        echo "Setting up SQLite..."
        cat > .env << EOF
# Environment variables - LOCAL DATABASE
DATABASE_URL="file:./dev.db"
SESSION_SECRET="tImBaDIbaKoBuAtBaiKdIBalaSkoKoApAMaSalaHmu"
ADMIN_PASSWORD_HASH="\$2a\$10\$bJpRHVjUw556WhjBW4RyF3OuYQz/TOSJKOEtz8Eok44NFQiW65oir6i"
PORT=3000
NODE_ENV=development
EOF
        echo "✅ SQLite configured"
        ;;
    2)
        read -p "Enter Supabase DATABASE_URL: " db_url
        cat > .env << EOF
# Environment variables - SUPABASE
DATABASE_URL="$db_url"
SESSION_SECRET="tImBaDIbaKoBuAtBaiKdIBalaSkoKoApAMaSalaHmu"
ADMIN_PASSWORD_HASH="\$2a\$10\$bJpRHVjUw556WhjBW4RyF3OuYQz/TOSJKOEtz8Eok44NFQiW65oir6i"
PORT=3000
NODE_ENV=production
EOF
        echo "✅ Supabase configured"
        ;;
    3)
        read -p "Enter PlanetScale DATABASE_URL: " db_url
        cat > .env << EOF
# Environment variables - PLANETSCALE
DATABASE_URL="$db_url"
SESSION_SECRET="tImBaDIbaKoBuAtBaiKdIBalaSkoKoApAMaSalaHmu"
ADMIN_PASSWORD_HASH="\$2a\$10\$bJpRHVjUw556WhjBW4RyF3OuYQz/TOSJKOEtz8Eok44NFQiW65oir6i"
PORT=3000
NODE_ENV=production
EOF
        echo "✅ PlanetScale configured"
        ;;
    4)
        read -p "Enter Railway DATABASE_URL: " db_url
        cat > .env << EOF
# Environment variables - RAILWAY
DATABASE_URL="$db_url"
SESSION_SECRET="tImBaDIbaKoBuAtBaiKdIBalaSkoKoApAMaSalaHmu"
ADMIN_PASSWORD_HASH="\$2a\$10\$bJpRHVjUw556WhjBW4RyF3OuYQz/TOSJKOEtz8Eok44NFQiW65oir6i"
PORT=3000
NODE_ENV=production
EOF
        echo "✅ Railway configured"
        ;;
    5)
        read -p "Enter Neon DATABASE_URL: " db_url
        cat > .env << EOF
# Environment variables - NEON
DATABASE_URL="$db_url"
SESSION_SECRET="tImBaDIbaKoBuAtBaiKdIBalaSkoKoApAMaSalaHmu"
ADMIN_PASSWORD_HASH="\$2a\$10\$bJpRHVjUw556WhjBW4RyF3OuYQz/TOSJKOEtz8Eok44NFQiW65oir6i"
PORT=3000
NODE_ENV=production
EOF
        echo "✅ Neon configured"
        ;;
    6)
        read -p "Enter custom DATABASE_URL: " db_url
        cat > .env << EOF
# Environment variables - CUSTOM
DATABASE_URL="$db_url"
SESSION_SECRET="tImBaDIbaKoBuAtBaiKdIBalaSkoKoApAMaSalaHmu"
ADMIN_PASSWORD_HASH="\$2a\$10\$bJpRHVjUw556WhjBW4RyF3OuYQz/TOSJKOEtz8Eok44NFQiW65oir6i"
PORT=3000
NODE_ENV=production
EOF
        echo "✅ Custom database configured"
        ;;
    *)
        echo "❌ Invalid option"
        exit 1
        ;;
esac

echo ""
echo "🔧 Next steps:"
echo "1. npx prisma generate"
echo "2. npx prisma migrate deploy (for cloud databases)"
echo "3. npm start"
echo ""
echo "🔍 Test connection: node debug-connection.js"
