# Proposed Flutter Web Structure

This is a proposed starting structure, not a frozen architecture.

```text
lib/
├── app/
├── config/
├── core/
│   ├── constants/
│   ├── errors/
│   ├── security/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── auth/
│   ├── bag/
│   ├── checkout/
│   ├── country/
│   ├── ebooks/
│   ├── owned_books/
│   ├── reader/
│   ├── reviews/
│   └── admin/
├── routing/
└── services/

test/
```

Feature folders are separated so the application does not become one large `main.dart`.

Within a feature:
- `data/` is for data-access implementation.
- `models/` is for approved data models.
- `presentation/` is for UI/screens/widgets for that feature.

This structure may change after the architecture and UI are explicitly approved.
