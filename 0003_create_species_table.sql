USE pet_shop;

DROP TABLE IF EXISTS species;

CREATE TABLE species (
   id INT NOT NULL AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL,
   PRIMARY KEY (id)
);
