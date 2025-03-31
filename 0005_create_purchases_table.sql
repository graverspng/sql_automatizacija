USE pet_shop;

DROP TABLE IF EXISTS purchases;

CREATE TABLE purchases (
   id INT NOT NULL AUTO_INCREMENT,
   pet_id INT NOT NULL,
   purchase_id INT NOT NULL,
   PRIMARY KEY (id)
);
