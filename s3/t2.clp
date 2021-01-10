;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Agentul se deplaseaza pe directia inainte, iar din stanga vine o ambulanta, insa este 
; departe. Agentul are culoarea verde la semafor, dar trebuie sa dea prioritate ambulantei.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; evenimente
(ag_percept 
	(percept_pobj ev1) 
	(percept_pname isa) 
	(percept_pval eveniment))
(ag_percept 
	(percept_pobj ev2) 
	(percept_pname isa) 
	(percept_pval eveniment))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sem 1

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
	(percept_pval verde))
(ag_percept 
	(percept_pobj s1) 
	(percept_pname directie) 
	(percept_pval inainte))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sem 2

(ag_percept 
	(percept_pobj s2) 
	(percept_pname isa) 
	(percept_pval semafor_masina))
(ag_percept 
	(percept_pobj s2) 
	(percept_pname partof) 
	(percept_pval ev1))
(ag_percept 
	(percept_pobj s2) 
	(percept_pname culoare) 
	(percept_pval rosu))
(ag_percept 
	(percept_pobj s2) 
	(percept_pname directie) 
	(percept_pval inainte))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ambulanta

(ag_percept 
	(percept_pobj automobil) 
	(percept_pname isa) 
	(percept_pval ambulanta))
(ag_percept 
	(percept_pobj automobil) 
	(percept_pname partof) 
	(percept_pval ev1))
(ag_percept 
	(percept_pobj automobil) 
	(percept_pname partof) 
	(percept_pval s2))
(ag_percept 
	(percept_pobj automobil) 
	(percept_pname directie) 
	(percept_pval inainte))
(ag_percept 
	(percept_pobj automobil) 
	(percept_pname distanta) 
	(percept_pval far))