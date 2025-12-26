# Velox Labs

AI-powered app development company. We build beautiful, clean, and simple apps.

## Project Structure

```
velox/
├── velox-www/          # Marketing website (Next.js)
├── velox-go/           # SSO & platform services (Next.js)
├── velox-nota/         # Notes app (Next.js)
├── docker-compose.yml  # Local PostgreSQL databases
└── dev.sh              # Development helper script
```

## Apps

| App | Status | Local Port | Description |
|-----|--------|------------|-------------|
| velox-www | Live | 3000 | Marketing website |
| velox-go | Live | 3002 | SSO & platform services |
| velox-nota | Live | 3001 | Markdown notes app |
| Velox Contacts | Coming Soon | 3003 | Smart contact management |
| Velox Inventory | Coming Soon | 3004 | Track everything you own |
| Velox Projects | Coming Soon | 3005 | Simple project tracking |

## Local Development

### Prerequisites
- Node.js 18+
- Docker & Docker Compose

### Quick Start

```bash
# Start PostgreSQL databases
docker-compose up -d

# Push database schemas
cd velox-go && npm run db:push
cd velox-nota && npm run db:push

# Start apps (in separate terminals)
cd velox-www && npm run dev              # http://localhost:3000
cd velox-nota && npm run dev -- -p 3001  # http://localhost:3001
cd velox-go && npm run dev -- -p 3002    # http://localhost:3002
```

Or use the helper script:
```bash
./dev.sh start   # Start everything
./dev.sh stop    # Stop everything
./dev.sh db      # Just databases
```

### Databases

| App | Port | Connection String |
|-----|------|-------------------|
| velox-go | 5432 | `postgresql://velox:velox@localhost:5432/velox_go` |
| velox-nota | 5433 | `postgresql://velox:velox@localhost:5433/velox_nota` |

### Environment Variables

Each app uses environment variables for URLs. In development, these point to localhost. See each app's `.env.example` for required variables.

## Tech Stack Preferences

- **Web**: Next.js, Tailwind CSS, TypeScript
- **Mobile**: Swift/SwiftUI (iOS), Kotlin (Android)
- **Backend**: Node.js, PostgreSQL
- **Hosting**: Digital Ocean

## Design Principles

- Dark minimal aesthetic (like Linear/Vercel)
- Clean typography (Geist font)
- Subtle animations
- Mobile-first responsive design

## Development

Each app lives in its own subdirectory with its own repository and CLAUDE.md file.
