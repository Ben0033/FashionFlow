CREATE DATABASE FashionFlow;

USE FashionFlow;

-- Table des couturiers
CREATE TABLE Couturiers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telephone VARCHAR(20),
    adresse VARCHAR(255)
);

-- Table des clients
CREATE TABLE Clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telephone VARCHAR(20),
    adresse VARCHAR(255)
);

-- Table des modèles
CREATE TABLE Modeles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    couturier_id INT,
    FOREIGN KEY (couturier_id) REFERENCES Couturiers(id)
);

-- Table des commandes
CREATE TABLE Commandes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    couturier_id INT,
    modele_id INT,
    date_commande DATE NOT NULL,
    date_livraison DATE,
    statut VARCHAR(50) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Clients(id),
    FOREIGN KEY (couturier_id) REFERENCES Couturiers(id),
    FOREIGN KEY (modele_id) REFERENCES Modeles(id)
);

-- Table des tâches
CREATE TABLE Taches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE,
    statut VARCHAR(50) NOT NULL,
    couturier_id INT,
    commande_id INT,
    FOREIGN KEY (couturier_id) REFERENCES Couturiers(id),
    FOREIGN KEY (commande_id) REFERENCES Commandes(id)
);

-- Table des notifications
CREATE TABLE Notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id INT,
    message TEXT NOT NULL,
    date_notification DATE NOT NULL,
    FOREIGN KEY (commande_id) REFERENCES Commandes(id)
);

-- ...existing code...
