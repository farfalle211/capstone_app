# Capstone App

A Ruby on Rails API application with event management, user authentication, and location-based services.

## Quick Start

### Prerequisites
- Docker and Docker Compose
- (Optional) Datadog API key for monitoring

### Running the Application

1. **Clone and navigate to the project:**
   ```bash
   git clone <your-repo-url>
   cd capstone_app
   ```

2. **Set up environment variables:**
   ```bash
   # Optional: Add your Datadog API key for monitoring
   export DD_API_KEY=your_datadog_api_key
   ```

3. **Start the application:**
   ```bash
   docker compose up --build
   ```
   The web container runs `db:migrate` on startup. On **first run** (or fresh clone), create the databases once:
   ```bash
   docker compose exec web rails db:create
   ```
   Then restart or let the entrypoint handle migrations on subsequent starts.

4. **Seed the database (optional, only when you want initial data):**
   ```bash
   docker compose exec web rails db:seed
   ```

5. **Access the application:**
   - API: http://localhost:3000
   - Database: PostgreSQL on localhost:5432
   - Static files: Served from `/public`

## API Endpoints

The application provides REST API endpoints for:
- **Users** - User management and authentication  
- **Events** - Event creation and management
- **Groups** - Group functionality
- **Requests** - Request handling
- **Images** - Image upload and management

## Tech Stack

- **Backend:** Ruby 2.5.3, Rails 5.2.8
- **Database:** PostgreSQL 13  
- **Authentication:** JWT with bcrypt
- **External Services:** Twilio, Geocoding
- **Monitoring:** Datadog APM (optional)
- **Containerization:** Docker with multi-service setup

## Development

To make changes during development, the application supports live code reloading through Docker volume mounting.

## Stopping the Application

```bash
docker compose down
```