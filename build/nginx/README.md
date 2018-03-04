# devedotus/deve:web

## Changelog
### 02/26/18
* Dockerfile: it's rewritten to add the www-data user and run nginx as www-data
* nginx.conf: very basic nginx.conf logging to stderr/stdout and including a default server
* default.conf: super simple config reading some static files and listening on port 8080 for testing
* config/html: static index.html, style.css and logo.png