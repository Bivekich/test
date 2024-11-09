# Используем официальный образ Node.js
FROM node:18-alpine

# Устанавливаем рабочую директорию
WORKDIR /usr/src/app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем остальные файлы
COPY . .

# Собираем Strapi проект
RUN npm run build

# Экспонируем порт
EXPOSE 1337

# Запускаем Strapi сервер
CMD ["npm", "run", "develop"]
