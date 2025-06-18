# Expense Tracker

Personal daily expense tracking application dengan desain mobile-first dan PWA support.

## 🚀 Quick Deploy ke Vercel

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fyour-username%2Fexpense-tracker)

## ✨ Features

- 🔐 **Password Protected** - Akses aman dengan autentikasi
- 📱 **Mobile-First Design** - Optimized untuk penggunaan mobile
- 📊 **Dashboard Interaktif** - Chart dan progress bar budget
- 💰 **Expense Tracking** - Tambah, edit, hapus pengeluaran
- 📈 **Reporting** - Laporan harian, mingguan, bulanan
- 🏷️ **Category Management** - CRUD kategori dan sumber dana
- 🎨 **Modern UI** - Animasi smooth dengan Tailwind CSS
- 📱 **PWA Support** - Install sebagai aplikasi mobile

## 🛠️ Tech Stack

- **Frontend**: HTML5 + Tailwind CSS + Alpine.js
- **Backend**: Node.js + Express.js
- **Database**: PostgreSQL + Prisma ORM
- **Charts**: Chart.js
- **Deployment**: Vercel
- **PWA**: Service Worker + Manifest

## 📋 Deployment ke Vercel

### 1. Persiapan Database

Buat database PostgreSQL gratis di:

- [Neon](https://neon.tech) (Recommended)
- [Supabase](https://supabase.com)
- [Railway](https://railway.app)

### 2. Deploy ke Vercel

1. Fork/clone repository ini
2. Login ke [vercel.com](https://vercel.com)
3. Import project dari GitHub
4. Set environment variables (lihat dibawah)
5. Deploy!

### 3. Environment Variables

```env
DATABASE_URL="postgresql://user:pass@host:5432/db?sslmode=require"
SESSION_SECRET="your-super-secret-key-minimum-32-characters"
ADMIN_PASSWORD_HASH="$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi"
```

**Generate Password Hash:**

```bash
node -e "console.log(require('bcryptjs').hashSync('your-password', 10))"
```

### 4. Setup Database

Setelah deploy, setup database schema:

```bash
# Install Prisma CLI
npm install -g prisma

# Set DATABASE_URL
export DATABASE_URL="your-connection-string"

# Push schema dan seed data
prisma db push
node prisma/seed.js
```

## 🎯 Default Access

- **URL**: `https://your-app.vercel.app`
- **Password**: `password` (ganti setelah login pertama)

## 📱 Mobile App

Aplikasi support PWA, dapat diinstall sebagai aplikasi mobile:

1. Buka di browser mobile
2. Pilih "Add to Home Screen"
3. Gunakan seperti aplikasi native

## 🔧 Local Development

**⚠️ PENTING: Gunakan `npm run dev`, BUKAN Live Server!**

Aplikasi ini menggunakan Node.js backend, jadi butuh server untuk berjalan.

### Quick Setup:

```bash
# 1. Clone repository
git clone <repo-url>
cd expense-tracker

# 2. Install dependencies
npm install

# 3. Setup environment
cp .env.example .env
# Edit .env dengan database connection

# 4. Setup database
npx prisma generate
npx prisma db push
node prisma/seed.js

# 5. Start development server (WAJIB!)
npm run dev
```

### Database Options:

1. **PostgreSQL Lokal** (Laragon/XAMPP):

   ```env
   DATABASE_URL="postgresql://root:@localhost:5432/expense_tracker"
   ```

2. **Database Cloud Gratis** (Neon/Supabase):
   ```env
   DATABASE_URL="postgresql://user:pass@host:5432/db?sslmode=require"
   ```

### Akses Development:

- **URL**: `http://localhost:3000`
- **Password**: `password`

### VS Code Tasks:

Gunakan VS Code task "Start Development Server" atau:

```bash
npm run dev
```

## 📚 Documentation

- **[Deployment Guide](DEPLOYMENT.md)** - Panduan lengkap deployment
- **[Installation Guide](INSTALL.md)** - Setup development lokal
- **[API Documentation](API.md)** - API endpoints (jika diperlukan)

## 🎨 Screenshots

### Mobile View

- Dashboard dengan chart dan progress bar
- Bottom navigation (Home, +, Laporan)
- Modal slide-up untuk tambah pengeluaran

### Features

- Budget tracking dengan color indicators
- Category dan source management
- Date range filtering
- Responsive design

## 🔒 Security

- Password hashing dengan bcrypt
- Session-based authentication
- Environment variables untuk sensitive data
- HTTPS enforced di production

## 📄 License

MIT License - bebas digunakan dan dimodifikasi

## 🤝 Contributing

1. Fork repository
2. Buat feature branch
3. Commit changes
4. Push ke branch
5. Create Pull Request

## 📞 Support

Jika ada pertanyaan atau issue:

1. Cek [Deployment Guide](DEPLOYMENT.md)
2. Buat issue di GitHub
3. Check Vercel deployment logs
