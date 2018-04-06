# Hello!

La team Bali 🌴 est la team la plus cool du monde, mais c'est aussi une team **rebelle 😈 !** 
*Pour cette journée, on a donc décidé de changer un peu les règles du jeu pour créer notre propre projet.*

___

### Say "Hi" to **My League** !

**My League** est une application mobile 📱 qui permet aux sportifs du dimanche ainsi qu'aux e-sportifs d'enregistrer chacun de leurs résultats et de les comparer avec ceux de leur communauté.

Pour promouvoir le produit, nous sommes partis sur deux axes :

1. Un axe **"particuliers"** pour toutcher directement notre cible : les futurs utilisateurs

    Avec une première landing page dédiée ➡️ https://myleagueproject.herokuapp.com/
    ..et un **twitter bot** des familles pour la promouvoir.
    
    Tu peux retrouver son code dans les services, *twitter_bot.rb*.
    [**What does the bot say?**](https://youtu.be/jofNR_WkoCE)
    
    + La première fonction **cherche** les derniers tweets en français contenant un hashtag précisé en entrée
    + La deuxième **like** les tweets en question
    + La troisième **envoie un tweet** tout prêt à leurs auteurs
    
    Tu peux jetter un oeil au compte Twitter créé pour l'app ➡️ https://twitter.com/my_league_pro
    
2. Un axe **"clubs"** : il s'agit d'utiliser les associations comme levier pour acquérir de nouveaux utilisateurs

    Avec une deuxième landing page dédiée ➡️ https://myleagueproject.herokuapp.com/club
    ... et une petite solution **d'envoi d'emails** automatisés.
    
    Le code correspond à plusieurs fichiers : 
    
    + *scrapping.rb* va chercher les mails d'un annuaire d'associations bordelaises
    + *send_email.rb* créé un spreadsheet avec les informations récoltées, puis envoie un mail à chaque association dont les coordonnées ont été récoltées
    
### Côté front...

Le choix a été fait de coder deux landing pages "maison" à l'aide de Bootstrap et d'une bonne dose de patience. _C'est 100% naturel, sans template ajouté, **avec des vrais morceaux de sélecteurs dedans.**_

### Les metrics...

Comment te dire... 12 heures pour sortir des metrics ? LOL.

Google Analytics a bien été implémenté.
En conditions réelles, on aurait mesuré le nombre de visites, le nombre de conversion et le taux de conversion (donc le rapport entre les deux).

Et plein d'autres choses avec plein d'autres outils de fouine 🐒, mais ceci est une autre histoire !

### On t'embrasse 😘

_Si besoin, tu peux nous contacter sur Slack :_
_@Leilacha, @sophie, @Robbyro, @Seb_

_Re-bisous 😘_
