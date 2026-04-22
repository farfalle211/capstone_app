# Capstone App

A Ruby on Rails API application with event management, user authentication, and location-based services.

## Quick Start

### Prerequisites
- Docker and Docker Compose (`docker compose` v2)
- Git
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

## CI and Datadog deployment visibility

Pushes to `master` run [`.github/workflows/docker-image.yml`](.github/workflows/docker-image.yml): `test`, then a **Mark deployment (Datadog)** job that runs `datadog-ci deployment mark` via `npx @datadog/datadog-ci@5` (synthetic `ci` environment; service `capstone_rails_app`). The job sets `DD_BETA_COMMANDS_ENABLED=1` (required for this subcommand in the `datadog-ci` CLI). The repository needs a `DD_API_KEY` **GitHub Actions secret** (same key as the static analysis workflow). The command is intended to run in GitHub Actions (supported CI provider for deployment mark).

To use [Monitor CI Providers Deployments](https://docs.datadoghq.com/continuous_delivery/deployments/ciproviders/) in Datadog, your org also needs [Pipeline Visibility](https://docs.datadoghq.com/continuous_integration/pipelines) for GitHub Actions and access to the CD visibility feature set where applicable. After a green run on `master`, check **CI > Deployments** in Datadog.

## Development

To make changes during development, the application supports live code reloading through Docker volume mounting.

## Stopping the Application

```bash
docker compose down
```