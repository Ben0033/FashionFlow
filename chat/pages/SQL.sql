-- Créer la base de données
CREATE DATABASE FashionFlow;

-- Utiliser la base de données
USE FashionFlow;

-- Créer la table des utilisateurs
CREATE TABLE Utilisateurs (
    UtilisateurID INT AUTO_INCREMENT PRIMARY KEY,
    NomUtilisateur VARCHAR(50) NOT NULL,
    MotDePasseHash VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DateCreation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Créer la table des messages de chat
CREATE TABLE MessagesChat (
    MessageID INT AUTO_INCREMENT PRIMARY KEY,
    UtilisateurID INT NOT NULL,
    ContenuMessage TEXT NOT NULL,
    DateEnvoi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UtilisateurID) REFERENCES Utilisateurs(UtilisateurID)
);
