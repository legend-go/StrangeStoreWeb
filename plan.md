# Strange Store Web — Master Plan

## Project Status
Initial foundation stage.

## 1. Product
Strange Store will initially be a responsive ebook-selling web application.

The initial product focus is ebooks. The architecture should allow future expansion to additional product/category types without unnecessarily building those features now.

## 2. Primary Platforms
- Initial platform: Flutter Web
- Development environment: Android Studio
- Language: Dart
- Future: a separate/related app may be developed later

## 3. Responsive Requirement
The website must work correctly across:
- Mobile screens
- Tablet-sized screens
- Laptop browser windows
- Desktop browser windows
- Resized browser windows

Responsive behavior must be implemented intentionally rather than relying on one fixed screen size.

## 4. Security Requirement
Security is a first-class requirement.

The implementation must actively consider:
- Authentication
- Authorization
- Database security
- Storage security
- Server-side validation
- Sensitive data exposure
- URL parameters and route manipulation
- IDOR / broken object-level authorization
- Client-side trust
- Input validation
- Secrets and API credentials
- Payment verification
- Ebook access control
- Download/file exposure
- Admin access
- Production/debug configuration

Important rule:
A URL containing a word or identifier is not automatically a vulnerability. The actual authorization and data exposure behavior must be evaluated.

No security-sensitive implementation should be assumed safe without reviewing the relevant architecture.

## 5. No-Assumption Rule
Do not assume missing requirements.

If UI behavior, business logic, data structure, naming, security behavior, payment behavior, or architecture is unclear:
1. Stop.
2. Explain what is unclear.
3. Ask the developer.
4. Continue only after clarification.

## 6. Human Approval Rule
Do not introduce unrequested architectural changes, dependencies, backend services, database structures, authentication behavior, or major refactors without approval.

Suggestions are welcome, but suggestions are not automatic approval.

## 7. Initial User Flow
The intended initial flow is:

Website opens
→ country detection is attempted
→ if detection is unavailable/unsuitable, user selects country
→ prices are displayed according to the selected country
→ user browses ebooks
→ user opens ebook details
→ user adds ebook to Bag
→ user reviews Bag
→ user proceeds to Checkout
→ Google authentication is required at the appropriate checkout stage
→ payment is processed and verified
→ purchased ebook becomes available in Owned Books
→ user reads the ebook through the website's own reader

Exact behavior for country detection, pricing, payment, authentication timing, and reading access remains subject to explicit design decisions.

## 8. Ebook Product Page
The initial ebook experience may contain:
- Ebook title/name
- Main cover image
- Additional images
- Price
- Description
- Reviews
- Add to Bag action

Do not add additional product fields until approved.

## 9. Bag
The project will use the term "Bag" rather than "Cart".

Users should be able to add ebooks to the Bag and review their selected ebooks before checkout.

## 10. Checkout
Checkout should show relevant purchase information such as:
- Ebook name
- Cover image
- Display/original price where applicable
- Discount where applicable
- Final price
- Total

Actual pricing and discount rules must be defined explicitly.

Important:
The client must never be treated as the final authority for the amount that should be paid.

## 11. Pricing / Currency
Country-specific pricing is required.

Initial example:
- India: ₹50
- Other countries: country-specific pricing to be defined

The project must distinguish between:
- Currency conversion
- Country-specific selling prices

The final approach will be explicitly selected before implementation.

## 12. Authentication
Users may browse without being logged in.

Google authentication is intended to be required for purchasing/ownership-related functionality.

Exact authentication flow will be finalized before implementation.

## 13. Owned Books
After a verified purchase, the user's account should have access to an Owned Books section.

Owned Books will show ebooks purchased by that user.

Ownership must be enforced by trusted backend authorization, not merely by hiding UI elements.

## 14. Ebook Reader
The ebook will be read inside the website.

The reader is a major user-experience feature and must be designed carefully.

The goal is to minimize common unauthorized access such as direct file exposure/download.

Important limitation:
A website cannot guarantee prevention of OS-level screenshots or external camera capture. Security controls should therefore focus on protecting the ebook source, access authorization, and common browser-level extraction/download paths.

Reader requirements will be defined separately before implementation.

## 15. Admin
A protected admin area is planned.

The same web application may contain:
- User-facing store
- Protected admin dashboard

Normal users must not gain admin privileges merely by discovering an admin route.

Admin authorization must be enforced server-side/backend-side using an appropriate role/permission model.

Admin features will be added only when explicitly specified.

## 16. Architecture
The project should be modular.

Do not place the entire application in `main.dart`.

`main.dart` should remain a lightweight application entry point.

UI, models, services, repositories, routing, configuration, authentication, product logic, checkout logic, reader logic, and other responsibilities should be separated into appropriate files/modules as the project grows.

Do not create unnecessary abstractions before they are needed.

## 17. Naming
`keyname.md` is the central naming registry.

Before introducing an important shared field/key/identifier:
- Check the existing naming registry.
- Reuse an existing approved name when applicable.
- Ask before creating a conflicting name.

## 18. Progress Tracking
`progress.md` records completed development work.

Every completed task is categorized:
- BIG
- MEDIUM
- SMALL

Do not mark work complete merely because code was written. Completion should reflect the agreed task state.

## 19. Documentation
The project maintains:
- `plan.md` — approved project requirements and decisions
- `progress.md` — completed development tasks
- `keyname.md` — shared field/key/identifier names

## 20. Current Scope
For the first implementation phase, prioritize:
1. Clean project foundation
2. Responsive web architecture
3. Security-aware architecture
4. Modular file structure
5. Documentation
6. Initial store UI after the UI specification is approved

Do not implement future ecommerce features simply because they may be useful later.

## 21. Development Rule
Before significant implementation:
- inspect the current project state
- identify ambiguity
- identify security risks
- ask required questions
- implement only approved behavior
- test where possible
- update documentation after completion

## 22. Visual Identity
The website should feel modern, mysterious, premium, slightly dark, and medieval/fantasy inspired. It should evoke the feeling of entering a mysterious store rather than a conventional ecommerce marketplace.

### Brand Colors
- **Primary brand color:** Pumpkin (#FD802E)
- **Secondary / dark brand color:** Charcoal (#233D4C)
- Do not introduce additional primary colors without approval.

### Typography
- **Primary Display/Headline:** Modern Antiqua
- **Decorative/Accent:** Felipa
- **Body Text:** Must remain highly readable.
- Do not replace these fonts without approval.

### Character / Seller
- An approved seller character image serves as the visual reference.
- The character is part of the store experience and branding.
- The atmospheric concept involves a road/path leading toward the store with the character appearing as part of the opening experience.

### Layout & Shapes
- Avoid generic modern SaaS styling (e.g., heavily rounded cards or pill-shaped components).
- Component corner radius will be decided per UI design.
- The visual concept must be responsive, adapting the composition for mobile and desktop rather than just scaling.

### Dark Mode
- Dark mode is not required at this stage.

## 23. Current Phase
The project is currently at the foundation stage. Responsive foundation and entry layer have been implemented. Visual identity has been defined.

No final UI design has been approved yet.

Do not invent the visual design.
