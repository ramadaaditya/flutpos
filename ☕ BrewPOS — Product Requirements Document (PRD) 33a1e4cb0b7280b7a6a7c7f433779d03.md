# ☕ BrewPOS — Product Requirements Document (PRD)

---

**Versi:** 1.0 MVP

**Tanggal:** April 2025

**Platform:** Android (Flutter)

**Backend:** Supabase

**Target Rilis:** Q3 2025

**Status:** MVP (Portfolio & Production Ready)

---

## 📌 Informasi Produk

- **Nama:** BrewPOS — Cafe POS App
- **Target:** Cafe & Coffee Shop
- **Author:** Flutter Developer (Entry Level)

---

## 🎯 Tujuan Dokumen

Dokumen ini mendefinisikan:

- Scope produk
- Fitur utama (MVP)
- Arsitektur teknis
- Rencana pengembangan

---

# 1. 🧾 Overview Produk

## 1.1 Latar Belakang

- Banyak cafe masih menggunakan:
    - Sistem manual
    - POS generik
- Kebutuhan:
    - Ringan
    - Offline-ready
    - Spesifik untuk cafe

---

## 1.2 Visi Produk

> "Aplikasi kasir modern untuk cafe yang sederhana, cepat, dan mudah digunakan oleh semua role."
> 

---

## 1.3 Target Pengguna

| Role | Deskripsi | Kebutuhan |
| --- | --- | --- |
| Owner | Pemilik cafe | Laporan, monitoring |
| Admin | Supervisor | Kelola produk |
| Cashier | Kasir | Transaksi cepat |

---

## 1.4 Scope Produk

### ✅ Termasuk

- Cafe dine-in & takeaway
- Skala kecil–menengah
- Single outlet

### ❌ Tidak termasuk (MVP)

- Multi outlet
- Payment gateway real
- Inventory detail
- Payroll
- Akuntansi

---

# 2. 🚀 Fitur MVP

## 2.1 Autentikasi & User

### Login & Session

- Email + password (Supabase Auth)
- Session persisten
- Logout manual
- Splash screen auth check

---

### Role-Based Access

| Fitur | Owner | Admin | Cashier |
| --- | --- | --- | --- |
| Dashboard | ✅ | ✅ | ❌ |
| Produk | ✅ | ✅ | ❌ |
| Transaksi | ✅ | ✅ | ✅ |
| Staff | ✅ | ❌ | ❌ |

---

## 2.2 Produk & Kategori

- CRUD kategori
- CRUD produk
- Varian:
    - Ukuran
    - Suhu
    - Gula
- Stok & indikator
- Filter kategori

---

## 2.3 Manajemen Meja

- Setup meja
- Status:
    - Available
    - Occupied
    - Reserved
- Grid UI dengan warna

---

## 2.4 Transaksi (Core)

### Flow

1. Pilih meja / takeaway
2. Pilih produk
3. Pilih varian
4. Review cart
5. Diskon
6. Pembayaran
7. Generate struk

---

### Pembayaran

- Tunai
- QRIS (simulasi)
- Transfer

---

### Cart Features

- Update qty
- Catatan item
- Diskon
- Pajak (PPN)
- Summary total

---

## 2.5 Struk

- Generate otomatis
- Share WhatsApp / PDF
- Format invoice standar

---

## 2.6 Kitchen Display

- Status:
    - Pending
    - In Progress
    - Completed
- Realtime update (Supabase)

---

## 2.7 Dashboard & Laporan

### Dashboard Owner

- Revenue harian
- Total transaksi
- Top menu
- Grafik 7 hari

---

### Laporan

- Filter waktu
- Detail transaksi
- Rekap pembayaran
- Export PDF

---

## 2.8 Pelanggan

- CRUD pelanggan
- Loyalty points
- Riwayat transaksi

---

## 2.9 Pengaturan

- Info toko
- Logo
- Pajak
- Footer struk

---

# 3. 🏗️ Arsitektur & Tech Stack

## 3.1 Tech Stack

| Layer | Tech |
| --- | --- |
| UI | Flutter |
| Backend | Supabase |
| State | Riverpod |
| Model | Freezed |
| DB Local | Hive |
| Chart | fl_chart |
| PDF | pdf + printing |
| Routing | go_router |

---

## 3.2 Clean Architecture

### Layer

### Domain

- Entities
- UseCases
- Repository interface

### Data

- Model
- Mapper
- Repository impl

### Presentation

- UI
- Provider (Riverpod)

---

## 3.3 Struktur Folder

```bash
lib/
 ├── core/
 ├── features/
 │   ├── auth/
 │   ├── product/
 │   ├── transaction/
 │   ├── table/
 │   ├── kitchen/
 │   ├── customer/
 │   └── settings/
 └── main.dart
```

---

## 3.4 Database (Supabase)

### Tabel Utama

- profiles
- products
- categories
- transactions
- transaction_items
- customers

---

## 3.5 RLS (Security)

- Role-based access
- Owner/Admin restriction
- RPC untuk operasi sensitif

---

# 4. 🔄 User Flow

## Login Flow

1. Splash
2. Check auth
3. Login
4. Redirect berdasarkan role

---

## Transaksi Flow

1. Pilih order type
2. Pilih produk
3. Tambah ke cart
4. Checkout
5. Simpan ke DB
6. Update stok
7. Kitchen display

---

## Kitchen Flow

- Pending → In Progress → Completed

---

## Laporan Flow

- Dashboard → filter → export

---

# 5. 🎨 UI/UX

## Principles

- Mobile-first
- Fast interaction
- Minimal UI
- Dark mode

---

## Navigasi

| Role | Menu |
| --- | --- |
| Cashier | Menu, Meja |
| Admin | Produk, Laporan |
| Owner | Dashboard |

---

## Komponen UI

- ProductCard
- CartBottomSheet
- TableGrid
- VariantPicker
- ReceiptSheet

---

# 6. 📦 Model Data

- User
- Product
- Category
- Transaction
- Customer

### ⚠️ Penting

- Snapshot harga di `transaction_items`

---

# 7. 📡 Offline Mode

## Cache Strategy

- Hive untuk local data
- Sync saat online

---

## Sync

- Queue transaksi
- Last-write-wins
- Indicator offline

---

# 8. 📅 Roadmap MVP

## Sprint Plan

| Sprint | Fokus |
| --- | --- |
| 1 | Setup + Auth |
| 2 | Produk |
| 3 | Meja + Cart |
| 4 | Checkout |
| 5 | Kitchen |
| 6 | Laporan |
| 7 | Customer |
| 8 | Offline |
| 9 | Testing |

---

## Definition of Done

- Tidak crash
- RLS aktif
- Offline berjalan
- Test coverage ≥ 60%

---

# 9. 🧪 Testing

## Unit Test

- UseCase
- Mapper
- Cart logic

## Widget Test

- UI utama

## Integration Test

- Login
- Transaksi
- Offline sync

---

# 10. ⚠️ Risiko

| Risiko | Solusi |
| --- | --- |
| Internet buruk | Offline mode |
| Stok race condition | RPC |
| Data tidak akurat | Snapshot |
| App size besar | Optimasi |

---

# 🏁 Catatan Akhir

BrewPOS adalah:

- Project portfolio
- Showcase Clean Architecture
- Fokus kualitas fitur inti

---

## 🚀 BONUS (AI-Friendly Improvements yang saya lakukan)

Struktur ini sekarang:

- ✅ Mudah diparse LLM
- ✅ Cocok untuk RAG / vector DB
- ✅ Section-based chunking
- ✅ Konsisten heading (`##`, `###`)
- ✅ Tabel untuk structured data

---

Kalau kamu mau next step (ini penting banget buat karir kamu 👇):

👉 Aku bisa bantu:

- Convert ini jadi **system design doc (HLD/LLD)**
- Generate **Flutter folder + boilerplate otomatis**
- Breakdown jadi **task Jira / sprint board**
- Atau bikin **AI agent yang bisa generate code dari PRD ini**

Tinggal bilang 👍