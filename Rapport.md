# Equipe XelOR

## Question 2

$$(p\oplus r \oplus s) \land (q \oplus \neg r \oplus s) \land (p \oplus q \oplus \neg s) \land (p \oplus \neg q \oplus \neg r)$$

On utilise d'abord la propriété suivante :

$$(\neg p) \oplus (\neg q) \equiv p \oplus q$$

Puis on ajoute deux variables $r'$ et $s'$ et on modifie la formule :

$$
(p\oplus r \oplus s) \land (q \oplus r' \oplus s) \land (p \oplus q \oplus s') \land (p \oplus q \oplus r) \land (r \oplus r') \land (s \oplus s')
$$

En effet $r \oplus r' \equiv r' = \neg r$.

Ainsi la nouvelle formule obtenue est équivalente à la première. 

## Question 3

Remarque : La propriété donnée est fausse : $(p \oplus p) \land x$ n'est pas satisfiable, mais $x\[ \neg p / p \] = x$ l'est. Pour que la propriété soit vraie, il faut que $p$ ne soit pas utilisée dans $G$.

Soit $\rho$ valuation telle que $\rho$ satisfait la formule $(p \oplus G) \land F$. Alors en particulier $\rho$ satisfait la formule $p \oplus G$.
On doit donc avoir $\rho(G) = 1 - \rho(p)$, et par suite $\rho(\neg G) = \rho(p)$. On en déduit $\rho(F) = \rho(F\[ \neg G /p \]) = 1$. Ainsi $F\[ \neg G /p \]$ est satisfiable.

Réciproquement, supposons que $\rho$ satisfait $F\[ \neg G / p \]$. On définit $\rho' := \rho \[ p \mapsto 1-\rho(G) \]$.
Ainsi $\rho'(p \oplus G) = 1$, et $\rho'(\neg G) = \rho'(p)$ car $p$ n'est pas utilisée dans $G$. D'où $\rho'(F) = \rho'(F \[ \neg G / p \] = 1$, et donc $(p \oplus G) \land F$ est satisfaite par $\rho'$.

Donc $(p \oplus G) \land F$ et $F\[ \neg G / p \]$ sont bien équisatisfiable (à condition que $p$ ne soit pas utilisée dans $G$).

## Question 4

