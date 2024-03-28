<h1 align="center" id="title">Delivery Pricing API</h1>

## About The Project
A REST API to caluate the delivery price dynamically based on organisation, zone and item_type. 
The primary focus is on a
dynamic pricing module to calculate the total cost of food delivery based on various factors.

## API
checkout the API here :- - [Dynamic_pricing_API](https://dynamicpricing.onrender.com) 
- API endpoint :- /price
- Allowed Method:- POST

- for more details visit the API page it has swagger page which documents the API.

## Built With

Following technologies and libraries are used for the development of this website

- [NodeJS]()
- [ExpressJs]()
- [Postgress SQL]()
- [swagger]() for API documentation

## Getting Started

To setup the project locally the steps below.
### Prerequisites

- [Node.js](https://nodejs.org/en/download/)
- [postgress SQL](https://www.postgresql.org/download/)
- [Git](https://git-scm.com/downloads)

### Local Repository Setup 

In general, we follow the "fork-and-pull" Git workflow.

1.  **Fork** the repo on GitHub
2.  **Clone** the project to your local system
3.  **Commit** changes to your own separate branch
4.  **Push** your work back up to your fork
5.  Submit a **Pull request** so that we can review your changes
  
### Running the project.

The project uses  NPM. 

```
## Checkout into the project

## Install Dependencies
npm install

## Run the Project
nodemon api/index.js or node api/index.js
```
Following are the commands to remove/add new dependencies using NPM

```
## Add a new Package
npm i package_name

## Remove an existing Package
npm remove package_name

## Save Package as a Dev Dependency
npm i -D package_name
```
### Setting up the Database locally

```
## Install postgressSQL

## Connect with Database using CLI or by GUI tool pgAdmin

## For credentials visit db.js file


