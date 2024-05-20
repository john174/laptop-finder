# Laptop Finder

Laptop Finder is a project designed to help users find the best laptops based on their specific needs and preferences. This project includes a backend service built with Node.js and Prisma ORM, providing a comprehensive API to fetch laptop models and their configurations.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Contributing](#contributing)
- [License](#license)

## Features

- Fetch laptop models and their configurations
- Search laptops based on specifications such as CPU, GPU, memory, storage, and more
- Easy-to-use API with detailed documentation

## Installation

To install and run the project locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/john174/laptop-finder.git
   cd laptop-finder
   ```

2. Install the dependencies:
   ```bash
   npm install
   ```

3. Set up the database:
   ```bash
   npx prisma migrate dev --name init
   ```

4. Start the development server:
   ```bash
   npm run dev
   ```

## Usage

Once the server is running, you can access the API endpoints to fetch laptop data. Use a tool like Postman or cURL to interact with the API.

## API Endpoints

Here are some of the available API endpoints:

- `GET /api/models`: Fetch all laptop models
- `GET /api/models/:id`: Fetch a specific laptop model by ID
- `POST /api/models`: Add a new laptop model
- `PUT /api/models/:id`: Update an existing laptop model
- `DELETE /api/models/:id`: Delete a laptop model

For detailed API documentation, refer to the [API Documentation](docs/api.md) (ensure you create this file and include detailed API usage).

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository
2. Create a new branch:
   ```bash
   git checkout -b feature-branch
   ```
3. Make your changes and commit them:
   ```bash
   git commit -m "Description of your changes"
   ```
4. Push to the branch:
   ```bash
   git push origin feature-branch
   ```
5. Open a pull request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
