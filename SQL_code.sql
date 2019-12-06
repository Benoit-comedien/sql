-- TD SQL 
use code_;
# Requete 1 Donner les caractéristiques des clients
select code_.client. idcli, nomcli, adrcli, cpcli, vilcli ,telcli 
from client;
# Requete 2 Donner toutes les villes des fournisseurs
select code_. fournisseur . vilfour from fournisseur;
#correction
select distinct vilfour from fournisseur;
#Requete 3 Donner les villes et codes postaux des clients
select code_.client. idcli, vilcli, cpcli from client;
#correction
order by asc.
#Requete 4 Donner, pour chaque piece son pric TTC
select code_.piece. nompce, pupce from piece;
#correction
select nompce, round (replace(pupce, ",",".")* 1.26, 2) as prix_piece_ttc
from piece;
#Requete 5 donner les caractéristiques des fournisseurs de Dijon
select code_.fournisseur. numfour , nomfour, vilfour
from fournisseur
where vilfour="dijon";
#Requete 6 Donnez les caractéristiques des commandes >= 1000 € 
update code_.commande set mtcde = replace (mtcde,",",".") ;
select * from commande;
update code_.commande set mtcde = replace (mtcde," ","") ;
describe commande;
update code_.commande set mtcde = cast(mtcde as float );
select * from commande where mtcde > 1000 ;
#Requete 7 Donnez la liste des clients habitant à Dijon et des clients habitant à Lyon 
select client.* from client where vilcli in ("lyon" , "dijon");
# Requete 8 Donner la liste des clients de Lyon, Paris , Marseille, Dijon
select client.* from client where vilcli in ("lyon" , "marseille" , "dijon" , "paris");
#Requete 9 Donner la liste des pieces dont les prix sont supérieurss à 800 et inférieurs à 1000
update code_.piece set pupce = replace (pupce,",",".") ;
select * from piece;
update code_.piece set pupce = replace (pupce," ","") ;
describe commande;
update code_.piece set pupce = cast(pupce as float );
select code_.piece.* from piece where pupce BETWEEN 800 and 1000 ;
#Requete 10 Donner la liste des clients qui commencent par M ( pas de % dans acess mais *)
select * from client where nomcli like 'm%';
#Requete 11 Donner la liste des clients dont on ignore les numéros de téléphone
select * from client where telcli IS NULL;
#correction
select * from client where telcli = "";
#Requete 12 Donner le nom des fournisseurs habitant à Lyon
select * from fournisseur where vilfour = "lyon";
#Requete 13 Donner, pour chaque piece son nom et son prix en dollars
select nompce, cast(pupce as float) as prix_dollars, nompce from piece having prix_dollars* 1.11;
describe prix_dollars;
#Requete 14 Dénombrer les clients qui ont déjà passés commandes
select count(idcli) as nombre
from commande group by idcli;
select count(nomcli) from client;
#Requete 15 Donner le nombre de commandes dont le montant dépasse 1000 euros
select * from commande having mtcde > 1000;
#correction
select count(numcde)from commande where cast(replace(replace(mtcde," ", ""), ",",".") as double)>1000;
#Requete 16 Donner le min, le max, et la moyenne des prix des pieces
select piece set pupce = cast(pupce as DOUBLE) and avg(pupce);
select _code. avg(pupce) from piece ;
select max(pupce) from piece ;
select min(pupce) from piece ;
#correction
select piece,
min(cast(replace(pupce," ", ""), ",",".")) as minimum
,max(cast(replace(pupce," ", ""), ",",".")) as maximum
,avg(cast(replace(pupce," ", ""), ",",".")) as moyenne
from piece;
#Rquete 17 donner le nombre total de pièces commandées par le client n°9002
#Requete 18 Donner, pour chaque client ayant commandé, son numéro et le montant cumulé

