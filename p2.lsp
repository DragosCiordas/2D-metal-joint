;Genereaza un disc (DONUT) in origine, utilizand recurile cu raza cea mai mare (exterior) respectiv cea mai mica (interior),
;dupa care sterge toate entitatile de pe foaia de desen 
(defun C:MAKEDONUT (/ ss ssall n a b c razamax razamin centru entcrt paranteza1 raza )

(setq ss (ssget "X" '((0 . "CIRCLE")))) ;selecteaza toate entitatile de tip cerc din foaia de desen
(setq ssall (ssget "X")) ;selecteaza toate entitatile din foaia de desen

  (setq n 0)
  (setq a 0.0)
  (setq b 0.0)
  (setq c 0.0)		;definirea variabilelor 
  (setq razamax 0)
  (setq razamin 9999)
  (setq centru (list a b c)) 


  (repeat (sslength ss)			;parcurgerea setului de selectie (ss)

    (setq entcrt (entget (ssname ss n))) ;obtinerea entitatii curente in variabila entcrt 
    (setq paranteza1 (assoc 40 entcrt))	;obtinerea grupului in care se afla raza
    (setq raza (cdr paranteza1)) ;si extragerea acesteia
    (if (> raza razamax)    ;gasirea razei maxime
   	(setq razamax raza))
    (if (< raza razamin)    ;respectiv minime
      	(setq razamin raza))
    ;(setq parantezanou (cons 40 raza))
    ;(setq entcrt (subst parantezanou paranteza1 entcrt))   ;actualizarea setului de selectie (ss)
    ;(entmod entcrt)
    (setq n (+ 1 n))  ;trecerea la urmatoarea entitate ;pasul urmator
)
(command "_.donut" (* 2 razamin) (* 2 razamax) centru  "") ;desenarea discului cu razele extrase
(command ".erase" ssall "") ;stergerea tuturor figurilor de pe desen
 
    (princ)
) 