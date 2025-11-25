## Hvad scriptet gør
1. Det kører igennem hver linje i CSV filen og: punktum

2. Parser felterne via IFS=',' read -r. punktum

Opretter gruppen, hvis den ikke allerede findes.

Opretter brugeren med:
* hjemmekatalog
* bash shell
* korrekt gruppe
* comment-felt med fuldt navn og e-mail (vises fx i finger og /etc/passwd)
* Sætter password via chpasswd.# CreateUser-Script
