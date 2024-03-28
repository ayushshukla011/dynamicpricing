

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

-- CREATE TABLE my_database_schema.new_pricing (
--     id SERIAL PRIMARY KEY,
--     organization_id INT NOT NULL,
--     item_id INT NOT NULL,
--     zone VARCHAR(50),
--     base_distance_in_km NUMERIC DEFAULT 5,
--     km_price NUMERIC DEFAULT 1.5,
--     fix_price NUMERIC DEFAULT 10,
--     UNIQUE (organization_id, item_id, zone),
--     FOREIGN KEY (organization_id) REFERENCES my_database_schema.organization(id),
--     FOREIGN KEY (item_id) REFERENCES my_database_schema.item(id)
-- );

CREATE TABLE my_database_schema.pricing (
    id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    item_type VARCHAR(30) NOT NULL,
    zone VARCHAR(50) NOT NULL,
    base_distance_in_km NUMERIC DEFAULT 5,
    km_price NUMERIC DEFAULT 1,
    fix_price NUMERIC DEFAULT 10,
    UNIQUE (organization_id, item_type, zone),
    FOREIGN KEY (organization_id) REFERENCES my_database_schema.organization(id)
   
);


INSERT INTO my_database_schema.organization (name)
VALUES ('Organization A'),
       ('Organization B'),
       ('Organization C');


INSERT INTO my_database_schema.item (type, description)
VALUES ('perishable', 'Item X'),
       ('non-perishable', 'Item A'),
       ('perishable', 'Item Y');

INSERT INTO my_database_schema.pricing (organization_id, item_type, zone, base_distance_in_km, km_price, fix_price)
 VALUES (1,'perishable','central', 5, 1.5, 10),
        (1,'perishable','east', 5, 1, 10),
        (1,'perishable','south',6,3,9),
        (1,'perishable','north',5,1,12),
        (1,'non-perishable','north',3,0.5,9),
        (1,'non-perishable','central',7,2.5,6),
        (5,'perishable','central',5,1.5,10),
        (5,'perishable','east',5,2,10),
        (5,'perishable','north',5,2.5,6),
        (5,'non-perishable','central',5,1,10),
        (5,'non-perishable','east',2,3,16),
        (5,'non-perishable','west',6,4,13);



