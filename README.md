# DWWM---oft

Création d'un site web pour un atelier de couture

## 📝 Description du projet

Ce projet consiste en la réalisation d'une application web dynamique pour un **Atelier de Couture**. Le site permet aux utilisateurs de consulter un catalogue de formations et d'ateliers thématiques, de se créer un compte et de réserver leurs créneaux en ligne.

> **Spécificité métier :** Afin de s'adapter aux besoins de l'artisan, **aucun paiement ne se fait en ligne**. Les réservations sont enregistrées sur le site et un lien de paiement sera envoyé aux clients.

---

## 👥 Acteurs & Fonctionnalités

### 1. Visiteur (Non connecté)

- Consulter le catalogue des ateliers et formations disponibles (filtrables par catégories).
- Créer un compte client.

### 2. Client (Connecté)

- Réserver une session d'atelier (avec mention et validation du paiement sur place).
- Accéder à son **Espace Personnel** pour suivre l'historique et le statut de ses réservations (En attente / Payé).
- Annuler une réservation en respectant les conditions de l'atelier.

### 3. Administrateur

- Accéder à un **Dashboard (Tableau de bord)** de gestion.
- Gérer le catalogue (Ajouter, modifier ou supprimer des ateliers/formations et des catégories).
- Gérer les réservations.
- Visualiser la liste des clients inscrits.

---

## 📐 Phase de Conception

Tous les documents contractuels et techniques sont centralisés dans le dossier `/docs` à la racine de ce dépôt :

- **Gestion de projet :** Plan de gestion du travail et spécifications fonctionnelles.
- **Cas d'utilisation :** Tableau de synthèse des _Use Cases_.
- **Modélisation de Données :** Modèle Conceptuel des Données (MCD) et Modèle Logique (MLD) conformes aux contraintes d'intégrité.
- **Interface :** Les 7 maquettes fonctionnelles (_Wireframes_) de l'application.

---

## 🗄️ Structure de la Base de Données

La persistance des données repose sur une base relationnelle SQL structurée autour de 4 tables principales :

- `users` : Gestion des profils (Clients et Administrateurs via un système de rôles).
- `categories` : Classification des types d'ateliers (ex: Débutant, Couture Éco-responsable, etc.).
- `ateliers` : Détails, horaires, prix et places disponibles pour chaque formation.
- `reservations` : Suivi des inscriptions et des états de paiement sur place.
