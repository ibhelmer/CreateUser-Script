# CreateUser-Script
## Hvad scriptet gør
Det kører igennem hver linje i CSV filen og: punktum

1. Parser felterne via IFS=',' read -r.
2. Opretter gruppen, hvis den ikke allerede findes.
3. Opretter brugeren med:
  * hjemmekatalog
  * bash shell
  * korrekt gruppe
  * comment-felt med fuldt navn og e-mail (vises fx i finger og /etc/passwd)
4. Sætter password via chpasswd.

## Udvidelser du kan lave
Der er plads til alt muligt sysadmin-nørkleri, fx:
  * tvinge password-skift ved første login
  * sætte individuelle hjemmekatalog-skabeloner
  * gensende velkomstmail
  * generere SSH-keys automatisk
  * audit-log til fil
