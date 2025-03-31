USE pet_shop;

DROP TABLE IF EXISTS purchase_pets;

CREATE TABLE purchase_pets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    purchase_id INT NOT NULL,
    pet_id INT NOT NULL,
    CONSTRAINT fk_purchase_pets_purchases FOREIGN KEY (purchase_id) REFERENCES purchases(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_purchase_pets_pets FOREIGN KEY (pet_id) REFERENCES pets(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
