# Dockerfile pour une application Nuxt 3 située dans le dossier app/
FROM node:20-alpine AS build

WORKDIR /app/app

# Copie des fichiers package.json et package-lock.json du dossier app
COPY app/package*.json ./

# Installation des dépendances dans app/
RUN npm install

# Copie du code source de app/
COPY app/. .

# Construction de l'application Nuxt
RUN npm run build

# Étape de production
FROM node:20-alpine AS production
WORKDIR /app/app

# Copie uniquement les fichiers nécessaires pour le run
COPY --from=build /app/app/package*.json ./
COPY --from=build /app/app/.output ./.output

# Installation des dépendances de production
RUN npm install --omit=dev

EXPOSE 3000

CMD ["node", ".output/server/index.mjs"] 