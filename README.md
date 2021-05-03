# Environnement de dev ready to use!

Script qui permet le déploiement d'un environnement standard php dans un container docker par une commande.

D'appuie sur un container microsoft PHP et Mariadb sans avoir besoin de configurer quoique ce soit.

Vous avez donc deux containers qui communique ensemble sans avoir aucune connaissance prélable en containerisation d'applicatifs.

les containers se lance directement dans vscode avec un shell bash dédié dans lequel vous pourrez faire vos manipulations dédiés.

## Prérequis

Le script installe automatiquement Docker si il n'est pas trouvé. 

Il faudra cependant les extensions suivantes

**VS Code**
* [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
* [Remote - Container](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)


## L'Environnement

Script d'installation disponible. Si vous lancez le script il installera le dossier en caché dans votre répertoire home.

**Ce que contient l'environnement**
* PHP (possibilité de choisir la version 7, 7.4 ou 73 dans le dockerfile)
* Apache 2 pré configuré
* toutes les dépendances PHP nécessaires
* Maria DB sur un autre container déjà pré-paramétré

**Extensions VS Code**
* SQL Tools (avoir acces à votre bdd directement dans votre VS code)
* Docblocker
* Twig-language-2
* composer
* vscode apache
* php getter & setter
* intelepense


pour respecter le psr-12 un indentation de 4 espaces a été configurer même si vous l'aviez configurer différemment.


## Getting Started
pour lancer l'installation :

```bash
sh install.sh
```

L'installation vous installe Docker si ce n'est déjà fait, et vous place l'alias pour copier le container directement. par une simple commande et l'ammener dans votre projet.

accéder au dossier de votre projet dans le terminal et lancer la commande: 

```bash
damp
```
damp : Docker Apache MariaDB PHP

lancer ensuite votre VS code. Si l'exention **Remote - Container** a bien été installer, Vscode devrait vous envoyé une notification pour lancer le dossier directement dans un container.


**Attention**
La première fois on vous demande de build le projet, c'est une étape qui peut mettre du temps car lors de la lecture du dockerfile, docker va récupérer toutes les dépendances nécessaire auprès du hub.

par la suite les projets se lanceront beaucoup plus rapidement car l'installation aura été mise en cache.



## Les alias

Quelques alias sont disponibles pour simplifier l'import et le lancement de l'environnement de travail.

lorsque vous serez dans le container et une fois que celui ci aura été lancé en remote: 

vous pouvez lancer les commandes suivantes: 

* envloc < paramètre >
  * permet de créer le fichier .env.local avec toutes les informations par défaut et donc de créer le composant d'accès au donné très facilement. En paramètre donner le nom que vous voulez donner à votre base de données par exemple: *envloc boucledb*

* commit "paramètre"
  * vous permet de faire un commit gitHub en faisant un git add ., git commit -m "votre commit", git push en une commande . exemple: commit "mon avancement dans le projet"


  