# Splitealo Backend

This is the backend for **Splitealo**, a full-stack web application designed to simplify splitting food or other bills among friends. The backend is built using **Express.js** and **Prisma**, with a lightweight **SQLite** database for local development.

---

## Features

- **API Endpoints**:
  - Endpoints for managing users, bills, and splits.
  - Support for equal and custom bill-splitting logic.

- **Database Integration**:
  - Prisma ORM for database management.
  - SQLite for local development.

- **Shareable Receipts**:
  - Generate and store unique receipts in the database.
  - Provide links for easy sharing.

---

## Tech Stack

- **Express.js**: For handling API requests and business logic.
- **Prisma**: For database management and querying.
- **SQLite**: A lightweight relational database for easy local development.

---

## Setup Instructions

### Prerequisites

- **Node.js** (v14 or newer)
- **npm** or **yarn**

---

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/splitealo-backend.git
   cd splitealo-backend
2. Install dependencies
   ```bash
   npm install
3. Set up the .env file:
   - Create a .env file in the root directory:
     ```bash
     touch .env
   - Add the following variables to the .env file:
     ```bash
      # Database connection URL
      DATABASE_URL="file:./dev.db"
      
      # Server configuration
      PORT=3000
      
      # Secrets (Replace with your actual secret values)
      JWT_SECRET="your-secure-jwt-secret"
      API_KEY="your-api-key"
      
      # Environment
      NODE_ENV=development
4. Configure Primsa
   - Initialize the database with prisma migrations:
     ```bash
     npx prisma migrate dev
5. Start the backend server:
   ```bash
   node server.js
6. The API will be accessible at:
   ```bash
   http://localhost:300

## Environment Variables
| **Variable**    | **Description**                                   | **Example**              |
|------------------|---------------------------------------------------|--------------------------|
| `DATABASE_URL`   | Connection URL for the SQLite database.           | `file:./dev.db`          |
| `PORT`           | Port number for the server (default: 3000).       | `3000`                   |
| `JWT_SECRET`     | Secret key for JSON Web Token (JWT) signing.      | `your-secure-jwt-secret` |
| `API_KEY`        | Example API key for external integrations.        | `your-api-key`           |
| `NODE_ENV`       | Application environment (e.g., `development`).    | `development`            |

  

    

