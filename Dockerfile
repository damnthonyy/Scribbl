# Dockerfile pour une application Nuxt 3 (structure : package.json à la racine, code dans app/)
FROM node:20-alpine AS build

WORKDIR /app

# Copie des fichiers package.json et package-lock.json de la racine
COPY package*.json ./

# Installation des dépendances à la racine
RUN npm install

# Copie du code source (y compris le dossier app/)
COPY . .

# Construction de l'application Nuxt (script build à la racine)
RUN npm run build

# Étape de production
FROM node:20-alpine AS production
WORKDIR /app

# Copie uniquement les fichiers nécessaires pour le run
COPY --from=build /app/package*.json ./
COPY --from=build /app/.output ./.output

# Installation des dépendances de production
RUN npm install --omit=dev

EXPOSE 3000

CMD ["node", ".output/server/index.mjs"] 