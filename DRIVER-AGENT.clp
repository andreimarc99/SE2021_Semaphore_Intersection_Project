;
;-------Auxiliary facts ---------------------------------------
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; stop-the-car


(defrule AGENT::red_color_left_sem
    (timp (valoare ?t))

	; sem masini rosu la stanga
    (ag_percept (percept_pobj ?e) (percept_pname isa) (percept_pval eveniment))
    (ag_percept (percept_pobj ?s1) (percept_pname isa) (percept_pval semafor_masina))
    (ag_percept (percept_pobj ?s1) (percept_pname partof) (percept_pval ?e))
    (ag_percept (percept_pobj ?s1) (percept_pname culoare) (percept_pval rosu))
    (ag_percept (percept_pobj ?s1) (percept_pname directie) (percept_pval stanga))

	; sem pietoni verde
    (ag_percept (percept_pobj ?s2) (percept_pname isa) (percept_pval semafor_pieton))
    (ag_percept (percept_pobj ?s2) (percept_pname partof) (percept_pval ?e))
    (ag_percept (percept_pobj ?s2) (percept_pname culoare) (percept_pval verde))

=>

    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname stop-the-car) (bel_pval yes)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname go-fwd) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-left) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-right) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname yield) (bel_pval no)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; turn-left


(defrule AGENT::green_color_left_sem
    (timp (valoare ?t))

    (ag_percept (percept_pobj ?e) (percept_pname isa) (percept_pval eveniment))
    (ag_percept (percept_pobj ?s) (percept_pname isa) (percept_pval semafor_masina))
    (ag_percept (percept_pobj ?s) (percept_pname partof) (percept_pval ?e))
    (ag_percept (percept_pobj ?s) (percept_pname culoare) (percept_pval verde))
    (ag_percept (percept_pobj ?s) (percept_pname directie) (percept_pval stanga))
=>
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-left) (bel_pval yes)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname go-fwd) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-right) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname stop-the-car) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname yield) (bel_pval no)))
)    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yield - masina vine din fata si agentul vrea sa vireze stanga

(defrule AGENT::green_color_left_sem_car_in_front
    (timp (valoare ?t))

	;; sem stanga verde
    (ag_percept (percept_pobj ?e) (percept_pname isa) (percept_pval eveniment))
    (ag_percept (percept_pobj ?s1) (percept_pname isa) (percept_pval semafor_masina))
    (ag_percept (percept_pobj ?s1) (percept_pname partof) (percept_pval ?e))
    (ag_percept (percept_pobj ?s1) (percept_pname culoare) (percept_pval verde))
    (ag_percept (percept_pobj ?s1) (percept_pname directie) (percept_pval stanga))

	;; sem din fata verde pe directia inainte
    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname isa) 
	(percept_pval semafor_masina))

    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname culoare) 
	(percept_pval verde))

    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname directie) 
	(percept_pval inainte))

	;; masina din fata 

    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname isa) 
	(percept_pval masina))

    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname partof) 
	(percept_pval ?s2))

    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname directie) 
	(percept_pval inainte))

    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname distanta) 
	(percept_pval close))
=>
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname yield) (bel_pval yes)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-left) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname go-fwd) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-right) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname stop-the-car) (bel_pval no)))
) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; turn-right - sem verde intermitent la dreapta si fara pietoni angajati in trecere

(defrule AGENT::flashing_green_color_right_sem
    (timp (valoare ?t))
	;; semaforul de pe directia agentului: dreapta - verde intermitent
    (ag_percept (percept_pobj ?e) (percept_pname isa) (percept_pval eveniment))

    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname isa) 
	(percept_pval semafor_masina))

    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname culoare) 
	(percept_pval verde_intermitent))

    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname directie) 
	(percept_pval dreapta))

	;; semaforul din fata agentului, de la pietoni, care este verde
    (ag_percept 	
	(percept_pobj ?s2) 
	(percept_pname isa) 
	(percept_pval semafor_pieton))

    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj s2) 
	(percept_pname culoare) 
	(percept_pval verde))

	;; semaforul din dreapta, de la pietoni, care este verde
    (ag_percept 
	(percept_pobj ?s3) 
	(percept_pname isa) 
	(percept_pval semafor_pieton))
    (ag_percept 
	(percept_pobj ?s3) 
	(percept_pname partof) 
	(percept_pval ?e))
    (ag_percept 
	(percept_pobj ?s3) 
	(percept_pname culoare) 
	(percept_pval verde))


;; pietoni care nu se afla pe trecere
    (ag_percept 
	(percept_pobj ?o1) 	
	(percept_pname isa) 
	(percept_pval pieton))

    (ag_percept 
	(percept_pobj ?o1) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj ?o1) 
	(percept_pname partof) 
	(percept_pval ?s2))

    (ag_percept 
	(percept_pobj ?o1) 
	(percept_pname traverseaza) 
	(percept_pval false))

	;; al doilea pieton 
    (ag_percept 
	(percept_pobj ?o2) 
	(percept_pname isa) 
	(percept_pval pieton))

    (ag_percept 
	(percept_pobj ?o2) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj ?o2) 
	(percept_pname partof) 
	(percept_pval ?s3))

    (ag_percept 
	(percept_pobj ?o2) 
	(percept_pname traverseaza) 
	(percept_pval false))


	;; semaforul din stanga, pentru masini, care este verde
    (ag_percept 
	(percept_pobj ?s4) 
	(percept_pname isa) 
	(percept_pval semafor_masina))

    (ag_percept 
	(percept_pobj ?s4) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj ?s4) 
	(percept_pname culoare) 
	(percept_pval verde))

    (ag_percept 
	(percept_pobj ?s4) 
	(percept_pname directie) 
	(percept_pval inainte))

	;; masina care vine din stanga, dar departe, deci nu e necesara oprirea
    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname isa) 
	(percept_pval masina))

    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname partof) 
	(percept_pval ?s4))

    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname directie) 
	(percept_pval inainte))

    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname distanta) 
	(percept_pval far))

	

=>

    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-right) (bel_pval yes)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname yield) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-left) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname go-fwd) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname stop-the-car) (bel_pval no)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; stop-the-car - sem verde intermitent la dreapta si pietoni angajati in trecere, masina din stanga aproape

(defrule AGENT::flashing_green_color_right_sem_pietoni
    (timp (valoare ?t))
	;; semaforul de pe directia agentului: dreapta - verde intermitent

    (ag_percept (percept_pobj ?e) (percept_pname isa) (percept_pval eveniment))

    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname isa) 
	(percept_pval semafor_masina))

    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname culoare) 
	(percept_pval verde_intermitent))

    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname directie) 
	(percept_pval dreapta))

	;; semaforul din fata agentului, de la pietoni, care este verde
    (ag_percept 	
	(percept_pobj ?s2) 
	(percept_pname isa) 
	(percept_pval semafor_pieton))

    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname culoare) 
	(percept_pval verde))

	;; semaforul din dreapta, de la pietoni, care este verde
    (ag_percept 
	(percept_pobj ?s3) 
	(percept_pname isa) 
	(percept_pval semafor_pieton))
    (ag_percept 
	(percept_pobj ?s3) 
	(percept_pname partof) 
	(percept_pval ?e))
    (ag_percept 
	(percept_pobj s3) 
	(percept_pname culoare) 
	(percept_pval verde))

	;; semaforul din stanga, pentru masini, care este verde
    (ag_percept 
	(percept_pobj ?s4) 
	(percept_pname isa) 
	(percept_pval semafor_masina))

    (ag_percept 
	(percept_pobj ?s4) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj ?s4) 
	(percept_pname culoare) 
	(percept_pval verde))

    (ag_percept 
	(percept_pobj ?s4) 
	(percept_pname directie) 
	(percept_pval inainte))

	;; masina care vine din stanga
    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname isa) 
	(percept_pval masina))

    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname partof) 
	(percept_pval ?s4))

    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname directie) 
	(percept_pval inainte))

    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname distanta) 
	(percept_pval close))

	;; pietoni care se afla pe trecere
    (ag_percept 
	(percept_pobj ?o1) 	
	(percept_pname isa) 
	(percept_pval pieton))

    (ag_percept 
	(percept_pobj ?o1) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj ?o1) 
	(percept_pname partof) 
	(percept_pval ?s2))

    (ag_percept 
	(percept_pobj o1) 
	(percept_pname traverseaza) 
	(percept_pval true))

	;; al doilea pieton 
    (ag_percept 
	(percept_pobj ?o2) 
	(percept_pname isa) 
	(percept_pval pieton))

    (ag_percept 
	(percept_pobj ?o2) 
	(percept_pname partof) 
	(percept_pval ?e))

    (ag_percept 
	(percept_pobj ?o2) 
	(percept_pname partof) 
	(percept_pval ?s3))

    (ag_percept 
	(percept_pobj ?o2) 
	(percept_pname traverseaza) 
	(percept_pval true))

=>

    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname stop-the-car) (bel_pval yes)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-right) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname yield) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-left) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname go-fwd) (bel_pval no)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yield - agentul merge inainte dar trebuie sa dea prioritate ambulantei care vine din stanga

(defrule AGENT::ambulance_priority
    (timp (valoare ?t))

    (ag_percept (percept_pobj ?e) (percept_pname isa) (percept_pval eveniment))

	;; semaforul din fata agentului
    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname isa) 
	(percept_pval semafor_masina))
    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname partof) 
	(percept_pval ?e))
    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname culoare) 
	(percept_pval verde))
    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname directie) 
	(percept_pval inainte))

	;; semaforul din stanga agentului
    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname isa) 
	(percept_pval semafor_masina))
    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname partof) 
	(percept_pval ?e))
    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname culoare) 
	(percept_pval rosu))
    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname directie) 
	(percept_pval inainte))

	;; ambulanta
    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname isa) 
	(percept_pval ambulanta))
    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname partof) 
	(percept_pval ?e))
    (ag_percept 
	(percept_pobj automobil) 
	(percept_pname partof) 
	(percept_pval ?s2))
    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname directie) 
	(percept_pval inainte))
    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname distanta) 
	(percept_pval close))

=> 
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname yield) (bel_pval yes)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname stop-the-car) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-right) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-left) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname go-fwd) (bel_pval no)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; go-fwd - agentul merge inainte indiferent de venirea ambulantei pt ca este departe 

(defrule AGENT::ambulance_no_priority
    (timp (valoare ?t))

    (ag_percept (percept_pobj ?e) (percept_pname isa) (percept_pval eveniment))

	;; semaforul din fata agentului
    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname isa) 
	(percept_pval semafor_masina))
    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname partof) 
	(percept_pval ?e))
    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname culoare) 
	(percept_pval verde))
    (ag_percept 
	(percept_pobj ?s1) 
	(percept_pname directie) 
	(percept_pval inainte))

	;; semaforul din stanga agentului
    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname isa) 
	(percept_pval semafor_masina))
    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname partof) 
	(percept_pval ?e))
    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname culoare) 
	(percept_pval rosu))
    (ag_percept 
	(percept_pobj ?s2) 
	(percept_pname directie) 
	(percept_pval inainte))

	;; ambulanta
    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname isa) 
	(percept_pval ambulanta))
    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname partof) 
	(percept_pval ?e))
    (ag_percept 
	(percept_pobj automobil) 
	(percept_pname partof) 
	(percept_pval ?s2))
    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname directie) 
	(percept_pval inainte))
    (ag_percept 
	(percept_pobj ?automobil) 
	(percept_pname distanta) 
	(percept_pval far))

=> 
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname go-fwd) (bel_pval yes)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname yield) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname stop-the-car) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-right) (bel_pval no)))
    (assert (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname turn-left) (bel_pval no)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;--------Print decision-----------------------------------
;
(defrule AGENT::tell
    (declare (salience -50))
    (timp (valoare ?)) ;make sure it fires each cycle
    (ASK ?bprop)
    ?fcvd <- (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname ?bprop) (bel_pval ?bval))
=>
    (printout t "         AGENT " ?bprop " " ?bval crlf)
    (retract ?fcvd)
)


;
;---------Housekeeping----------------------------------
;

;---------Delete auxiliary facts----------

;---------Delete instantaneous beliefs, i.e, those which are not fluents
(defrule AGENT::hk-eliminate-momentan-current-bel
    (declare (salience -90))
    (timp (valoare ?)) ;make sure it fires each cycle
    ?fmcb <- (ag_bel (bel_type moment) (bel_timeslice 0) (bel_pname ?p) (bel_pval ?v))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>hk-eliminate-momentan-current-bel " ?p " " ?v crlf))
    (retract ?fmcb)
)
