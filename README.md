# SpiderBot

---

## Here we go...

### First things First

Start the postgresql docker.

* POSTGRES_USER = frederico
* POSTGRES_PASSWORD = @SenhaSuperCabulosa#321@
* POSTGRES_DB = crawler
* POSTGRESQL_PORT = 5432

```bash
(venv)[ user@~/project/spiderbot ] $: cd /srv/db
(venv)[ user@~/project/spiderbot/srv/db ] $: docker-compose up -d 

```

### Run the spiderbot

```bash
(venv)[ user@~/project/spiderbot ] $: scrapy runspider SiperderBot src/crawler/./main.py
```

---
