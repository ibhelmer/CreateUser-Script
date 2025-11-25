## Hvad scriptet gør
Det kører igennem hver linje i CSV filen og: punktum

1. Parser felterne via IFS=',' read -r.
2. Opretter gruppen, hvis den ikke allerede findes.
3. Opretter brugeren med:.
* hjemmekatalog
* bash shell
* korrekt gruppe
* comment-felt med fuldt navn og e-mail (vises fx i finger og /etc/passwd)
* Sætter password via chpasswd.# CreateUser-Script
