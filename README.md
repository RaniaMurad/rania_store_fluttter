# Rania Store 🛍️

A modern e-commerce mobile application built with Flutter.

## 📱 About The Project

Rania Store is a modern shopping application that allows users to browse products, view product details, add products to favorites and cart, complete checkout, and manage their orders.

## ✨ Features

- 🛍️ Browse products
- 📂 Browse product categories
- 🔍 Search for products
- ❤️ Add products to favorites
- 🛒 Add products to cart
- ➕ Increase and decrease product quantity
- 📦 Checkout
- 💳 Payment
- 📋 View orders
- 👤 User profile
- 🔔 Notifications
- ⚙️ Settings

## 🛠️ Technologies

- Flutter
- Dart
- BLoC / Cubit
- Dio
- Retrofit
- GetIt
- Freezed
- REST API

## 🌐 API

This project uses Fake Store API to fetch product data.

## 📁 Project Structure

```text
lib/
├── core/
│   ├── di/
│   ├── models/
│   ├── network/
│   ├── repos/
│   └── theme/
│
└── features/
    ├── auth/
    ├── cart/
    ├── categories/
    ├── favorite/
    ├── home/
    ├── orders/
    ├── products/
    └── profile/
