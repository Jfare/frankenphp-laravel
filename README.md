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
**npm** - alias dnpm "docker compose run --rm npm"
**php** - alias dphp "docker compose run php php"

### macOS

Open your shell-profile with the following command:
"nano ~/.zshrc

Add the following lines at the bottom of the file:
(you can name your aliases to anything you want, the following aliases are only suggestions)

**composer** - alias dcomposer "docker compose run --rm composer"
**npm** - alias dnpm "docker compose run --rm npm"
**php** - alias dphp "docker compose run php php"

### Windows
Open your Powershell-profile with the following line:
"notepad $PROFILE"

Add the following lines:

function dcomposer { docker compose run --rm composer --% $args }
function dnpm { docker compose run --rm npm --% $args }
function dphp { docker compose run php php --% $args }

restart Powershell or run & $PROFILE

## Create a new Laravel Project

Assuming you have created the aliases above:

run the following command in your project root directory:

"dcomposer create-project laravel/laravel ." 