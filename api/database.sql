

-- sql queries that have been executed


--zones "central","east","west","south","north";

CREATE SCHEMA my_database_schema;

CREATE TABLE my_database_schema.organization (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE my_database_schema.item (
    id SERIAL PRIMARY KEY,
    type VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE my_database_schema.new_pricing (
    id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    item_id INT NOT NULL,
    zone VARCHAR(50),
    base_distance_in_km NUMERIC DEFAULT 5,
    km_price NUMERIC DEFAULT 1.5,
    fix_price NUMERIC DEFAULT 10,
    UNIQUE (organization_id, item_id, zone),
    FOREIGN KEY (organization_id) REFERENCES my_database_schema.organization(id),
    FOREIGN KEY (item_id) REFERENCES my_database_schema.item(id)
);

INSERT INTO my_database_schema.organization (name)
VALUES ('Organization A'),
       ('Organization B'),
       ('Organization C');


INSERT INTO my_database_schema.item (type, description)
VALUES ('perishable', 'Item X'),
       ('non-perishable', 'Item A'),
       ('perishable', 'Item Y');

INSERT INTO my_database_schema.new_pricing (organization_id, item_id, zone, base_distance_in_km, km_price, fix_price)
 VALUES (1, 1,'central', 5, 1.5, 10),
        (1, 1,'east', 5, 1, 10),
        (1,2,'south',6,3,9),
        (1,3,'east',5,2,15),
        (2,1,'central',5,1,12),
        (2,2,'west',5,2.5,14),
        (5,1,'central',5,1.5,10),
        (5,1,'east',5,2,10),
        (5,1,'west',5,2.5,10),
        (5,2,'central',5,1,10);

ALTER TABLE my_database_schema.new_pricing RENAME TO pricing;

