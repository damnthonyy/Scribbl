# Dockerfile pour une application Nuxt 3 (TypeScript)
FROM node:20-alpine AS build

WORKDIR /app

# Copie des fichiers package.json et package-lock.json
COPY package*.json ./

# Installation des dépendances
RUN npm install

# Copie du code source
COPY . .

# Construction de l'application Nuxt
RUN npm run build --prefix app

# Étape de production
FROM node:20-alpine AS production
WORKDIR /app

# Copie uniquement les fichiers nécessaires pour le run
COPY --from=build /app/package*.json ./
COPY --from=build /app/app/.output ./.output

# Installation des dépendances de production
RUN npm install --omit=dev

EXPOSE 3000

CMD ["node", ".output/server/index.mjs"] 