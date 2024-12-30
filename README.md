# Docker environment for FrankenPHP with Composer and NPM

## Prerequisites

Docker Engine
(or Docker Desktop which inlcudes Docker Engine).

If you are using Linux you will have to create a directory called "src" unless you are the root user.

## Create a Aliases for easier use

### Linux or older macOS
Open your baschrc with the following command:
"sudo nano ~/.bashrc"

Add the following lines at the bottom of the file:
(you can name your aliases to anything you want, the following aliases are only suggestions)

**composer** - alias dcomposer "docker compose run --rm composer"  
**npm** - alias dnpm "docker compose exec php npm"  
**php** - alias dphp "docker compose exec php php"  

### macOS

Open your shell-profile with the following command:
"nano ~/.zshrc

Add the following lines at the bottom of the file:
(you can name your aliases to anything you want, the following aliases are only suggestions)

**composer** - alias dcomposer "docker compose run --rm composer"  
**npm** - alias dnpm "docker compose exec php npm"  
**php** - alias dphp "docker compose exec php php"  

### Windows
Open your Powershell-profile with the following line:
"notepad $PROFILE"

Add the following lines:

**composer** function dcomposer { docker compose run --rm composer --% $args }  
**npm** function dnpm { docker compose exec php npm --% $args }  
**php** function dphp { docker compose exec php php --% $args }  

restart Powershell or run & $PROFILE

## Create a new Laravel Project

Assuming you have created the aliases above:

run the following command in your project root directory:

"dcomposer create-project laravel/laravel ." 

## Use Vite in your project

Update vite.config.js to look like this:


export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
    ],
    server: {
        host: '0.0.0.0',
        port: 5173,
        strictPort: true,
        cors: {
            origin: 'https://localhost',
            credentials: true,
        },
        hmr: {
            host: 'localhost',
        },
    },
});


