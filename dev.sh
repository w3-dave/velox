#!/bin/bash

# Velox Labs Local Development Script
# Usage: ./dev.sh [start|stop|db|logs]

set -e

case "$1" in
  start)
    echo "Starting Velox development environment..."

    # Start databases
    docker-compose up -d
    echo "Waiting for databases to be ready..."
    sleep 3

    # Push Prisma schemas
    echo "Syncing database schemas..."
    (cd velox-go && npm run db:push)
    (cd velox-nota && npm run db:push)

    # Start all apps
    echo "Starting apps..."
    (cd velox-www && npm run dev &)
    (cd velox-nota && npm run dev -- -p 3001 &)
    (cd velox-go && npm run dev -- -p 3002 &)

    echo ""
    echo "All services started:"
    echo "  velox-www:  http://localhost:3000"
    echo "  velox-nota: http://localhost:3001"
    echo "  velox-go:   http://localhost:3002"
    echo ""
    echo "Press Ctrl+C to stop all services"
    wait
    ;;

  stop)
    echo "Stopping all services..."
    pkill -f "next dev" || true
    docker-compose down
    echo "Done."
    ;;

  db)
    echo "Starting databases only..."
    docker-compose up -d
    echo ""
    echo "Databases running:"
    echo "  velox-go:   postgresql://velox:velox@localhost:5432/velox_go"
    echo "  velox-nota: postgresql://velox:velox@localhost:5433/velox_nota"
    ;;

  logs)
    docker-compose logs -f
    ;;

  *)
    echo "Velox Labs Development Environment"
    echo ""
    echo "Usage: ./dev.sh [command]"
    echo ""
    echo "Commands:"
    echo "  start   Start databases and all apps"
    echo "  stop    Stop all services"
    echo "  db      Start databases only"
    echo "  logs    View database logs"
    echo ""
    echo "Manual start (after ./dev.sh db):"
    echo "  cd velox-www  && npm run dev"
    echo "  cd velox-nota && npm run dev -- -p 3001"
    echo "  cd velox-go   && npm run dev -- -p 3002"
    ;;
esac
