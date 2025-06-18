// Deployment Readiness Checker
const fs = require('fs');
const path = require('path');

console.log("🚀 DEPLOYMENT READINESS CHECKER");
console.log("=".repeat(50));

// 1. Check .env file
console.log("\n📄 Environment File Check:");
const envPath = path.join(__dirname, '.env');
if (fs.existsSync(envPath)) {
  console.log("✅ .env file exists");
  const envContent = fs.readFileSync(envPath, 'utf8');
  const lines = envContent.split('\n').filter(line => line.trim() && !line.startsWith('#'));
  console.log(`✅ Found ${lines.length} environment variables`);
  
  // Check required variables
  const required = ['DATABASE_URL', 'SESSION_SECRET', 'ADMIN_PASSWORD_HASH'];
  required.forEach(key => {
    const exists = envContent.includes(key + '=');
    console.log(`${exists ? '✅' : '❌'} ${key}: ${exists ? 'SET' : 'MISSING'}`);
  });
} else {
  console.log("❌ .env file missing");
}

// 2. Check package.json scripts
console.log("\n📦 Package.json Check:");
const packagePath = path.join(__dirname, 'package.json');
if (fs.existsSync(packagePath)) {
  const pkg = JSON.parse(fs.readFileSync(packagePath, 'utf8'));
  console.log("✅ package.json exists");
  console.log(`✅ Start script: ${pkg.scripts?.start || 'MISSING'}`);
  console.log(`✅ Build script: ${pkg.scripts?.build || 'NOT SET'}`);
  console.log(`✅ Postinstall: ${pkg.scripts?.postinstall || 'NOT SET'}`);
} else {
  console.log("❌ package.json missing");
}

// 3. Check Prisma
console.log("\n🔧 Prisma Check:");
const schemaPath = path.join(__dirname, 'prisma', 'schema.prisma');
if (fs.existsSync(schemaPath)) {
  console.log("✅ Prisma schema exists");
  const schema = fs.readFileSync(schemaPath, 'utf8');
  const provider = schema.match(/provider\s*=\s*"([^"]+)"/)?.[1];
  console.log(`✅ Database provider: ${provider}`);
} else {
  console.log("❌ Prisma schema missing");
}

// 4. Check critical files
console.log("\n📁 Critical Files Check:");
const criticalFiles = [
  'server.js',
  'public/index.html',
  'public/js/app.js',
  'prisma/schema.prisma'
];

criticalFiles.forEach(file => {
  const exists = fs.existsSync(path.join(__dirname, file));
  console.log(`${exists ? '✅' : '❌'} ${file}`);
});

// 5. Deployment platform specific checks
console.log("\n🌐 Deployment Platform Recommendations:");
console.log("For Vercel:");
console.log("  - Add vercel.json with rewrite rules");
console.log("  - Set environment variables in Vercel dashboard");
console.log("  - Use edge runtime compatible database");

console.log("\nFor Netlify:");
console.log("  - Add _redirects file");
console.log("  - Set environment variables in Netlify dashboard");
console.log("  - Use build command: npm run build");

console.log("\nFor Railway:");
console.log("  - Connect GitHub repository");
console.log("  - Set environment variables in Railway dashboard");
console.log("  - Railway will auto-detect Node.js");

console.log("\nFor Heroku:");
console.log("  - Add Procfile");
console.log("  - Set environment variables with heroku config:set");
console.log("  - Use production database");

console.log("\n" + "=".repeat(50));
console.log("🎯 Next Steps:");
console.log("1. Ensure .env variables are set in deployment platform");
console.log("2. Verify database is accessible from deployment platform");
console.log("3. Check logs in deployment platform for specific errors");
console.log("4. Test database connection from deployment environment");
