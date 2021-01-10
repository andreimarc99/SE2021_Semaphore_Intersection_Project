;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Masina vrea sa vireze dreapta, semaforul pe directia lui e verde intermitent, iar in fata sa si la 
; dreapta nu se afla pietoni pe trecere, desi au verde la semafor. Semaforul pentru directia stanga este rosu,
; iar din stanga se afla, departe de agent, o masina ce se deplaseaza pe directia inainte.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; evenimente

(ag_percept 
	(percept_pobj ev1) 
	(percept_pname isa) 
	(percept_pval eveniment))
(ag_percept 	
	(percept_pobj ev2) 
	(percept_pname isa) 
	(percept_pval eveniment))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;sem 2 

(ag_percept 
	(percept_pobj s1) 
	(percept_pname isa) 
	(percept_pval semafor_masina))

(ag_percept 
	(percept_pobj s1) 
	(percept_pname partof) 
	(percept_pval ev1))

(ag_percept 
	(percept_pobj s1) 
	(percept_pname culoare) 
	(percept_pval verde_intermitent))

(ag_percept 
	(percept_pobj s1) 
	(percept_pname directie) 
	(percept_pval dreapta))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sem 3 

(ag_percept 	
	(percept_pobj s2) 
	(percept_pname isa) 
	(percept_pval semafor_pieton))

(ag_percept 
	(percept_pobj s2) 
	(percept_pname partof) 
	(percept_pval ev1))

(ag_percept 
	(percept_pobj s2) 
	(percept_pname culoare) 
	(percept_pval verde))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sem 4 

(ag_percept 
	(percept_pobj s3) 
	(percept_pname isa) 
	(percept_pval semafor_pieton))
(ag_percept 
	(percept_pobj s3) 
	(percept_pname partof) 
	(percept_pval ev1))
(ag_percept 
	(percept_pobj s3) 
	(percept_pname culoare) 
	(percept_pval verde))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; pietoni
; o1
(ag_percept 
	(percept_pobj o1) 	
	(percept_pname isa) 
	(percept_pval pieton))

(ag_percept 
	(percept_pobj o1) 
	(percept_pname partof) 
	(percept_pval ev1))

(ag_percept 
	(percept_pobj o1) 
	(percept_pname partof) 
	(percept_pval s2))

(ag_percept 
	(percept_pobj o1) 
	(percept_pname traverseaza) 
	(percept_pval false))

; o2
(ag_percept 
	(percept_pobj o2) 
	(percept_pname isa) 
	(percept_pval pieton))

(ag_percept 
	(percept_pobj o2) 
	(percept_pname partof) 
	(percept_pval ev1))

(ag_percept 
	(percept_pobj o2) 
	(percept_pname partof) 
	(percept_pval s3))

(ag_percept 
	(percept_pobj o2) 
	(percept_pname traverseaza) 
	(percept_pval false))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sem 5

(ag_percept 
	(percept_pobj s5) 
	(percept_pname isa) 
	(percept_pval semafor_masina))

(ag_percept 
	(percept_pobj s5) 
	(percept_pname partof) 
	(percept_pval ev1))

(ag_percept 
	(percept_pobj s5) 
	(percept_pname culoare) 
	(percept_pval verde))

(ag_percept 
	(percept_pobj s5) 
	(percept_pname directie) 
	(percept_pval inainte))

; masina
(ag_percept 
	(percept_pobj automobil) 
	(percept_pname isa) 
	(percept_pval masina))

(ag_percept 
	(percept_pobj automobil) 
	(percept_pname partof) 
	(percept_pval ev1))

(ag_percept 
	(percept_pobj automobil) 
	(percept_pname partof) 
	(percept_pval s5))

(ag_percept 
	(percept_pobj automobil) 
	(percept_pname directie) 
	(percept_pval inainte))

(ag_percept 
	(percept_pobj automobil) 
	(percept_pname distanta) 
	(percept_pval far))