# ⚡ 60-Second Quick Start to GitHub Upload

## الطريقة الأسرع (بدون أي تعقيدات)

### 1️⃣ إنشاء Repository (1 دقيقة)

```
👉 اذهب: https://github.com/new
👉 الاسم: the-legacy-workflow
👉 الرؤية: Public
👉 اضغط: Create repository
```

### 2️⃣ إنشاء Token (2 دقيقة)

```
👉 اذهب: https://github.com/settings/tokens
👉 اختر: Generate new token (classic)
👉 الاسم: the-legacy-workflow-upload
👉 مدة الصلاحية: 90 days
👉 اختر Scopes: repo, workflow, admin:repo_hook
👉 اضغط: Generate
👉 انسخ الـ Token
```

### 3️⃣ رفع الكود (3 أوامر فقط) ⚡

```bash
# الأمر 1: أضف الـ remote
git remote add origin https://USERNAME:TOKEN@github.com/USERNAME/the-legacy-workflow.git

# الأمر 2: غير اسم الفرع
git branch -M main

# الأمر 3: رفع الكود
git push -u origin main
```

### 4️⃣ إنشاء Release (اختياري)

```bash
git tag -a v3.0.0 -m "Initial Release"
git push origin v3.0.0
```

---

## ✅ تم!

مشروعك الآن على GitHub! 🎉

```
https://github.com/USERNAME/the-legacy-workflow
```

---

## 📝 ملاحظات مهمة:

| الخطوة | الوقت | الملاحظات |
|--------|-------|---------|
| Repository | 1 min | لا تختر Initialize |
| Token | 2 min | انسخه فوراً |
| Upload | 1 min | 3 أوامر فقط |
| **المجموع** | **~5 min** | **بسيط جداً** |

---

## 🔒 أمان:

```bash
# بعد الرفع، أزل الـ Token من الـ remote:
git config --global credential.helper store
git remote set-url origin https://github.com/USERNAME/the-legacy-workflow.git
```

---

**That's it! 🚀 Project is Live!**
