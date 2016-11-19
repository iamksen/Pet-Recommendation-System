(defrule start
    ?state <- (state start)
    =>
    (printout t crlf)
	(unwatch all) ;for debuggin purpose
    (printout t "#################################################################################" crlf)
    (printout t "#                                                                               #" crlf)
	(printout t "#                             PET RECOMMENDATION SYSTEM                         #" crlf)
	(printout t "#                                                                               #" crlf)
    (printout t "#################################################################################" crlf)
    (printout t crlf)
		(printout t "Please enter your name :: ")
    (bind ?response (read))
    (printout t "Hello " ?response ". Please answer the following questions to find your buddy!" crlf)
	(retract ?state)
    (assert (state question)))

(deffacts start
    (state start))

(defrule terminate
    (declare (salience 100))
    (state terminated)
    =>
    (printout t "Would you like to have one more pet? (Yes/No)" crlf)
    (bind ?response (read))
    (if (eq ?response Yes)
    then
        (reset)
    else
        (halt)))

(defrule suggest
    ;(declare (salience 99))
    ?state <- (state suggest)
    =>
    (bind ?petes (find-all-facts ((?f pet)) (eq 1 1)))
		;(printout t "Lengths " (length$ ?petes) crlf)
    (if (eq (length$ ?petes) 0)
    then
        (printout t "Sorry, I can't find any pet of your choice!" crlf)
        (retract ?state)
        (assert (state terminated))
    else
        (bind ?somepet (nth$ (+ 1 (mod (random) (length$ ?petes))) ?petes))
        (bind ?name (fact-slot-value ?somepet name))
        (printout t "I'd suggest you have " ?name ". Does that sound good? (Yes/No)" crlf)
        (bind ?response (read))
        (if (eq ?response Yes)
        then
            (printout t "It was a great time to suggest you a pet. See you next Time. Have a good day!" crlf)
            (retract ?state)
            (assert (state terminated))
        else
            (retract ?somepet)
            (retract ?state)
            (assert (state question)))))

(defrule one-option-or-less
    (declare (salience 98))
    ?check <- (check-remaining)
    ?state <- (state question)
    =>
    (if (< (length$ (find-all-facts ((?f pet)) (eq 1 1))) 2)
    then
        (retract ?state)
        (bind ?petes (find-all-facts ((?f pet)) (eq 1 1)))
        (bind ?somepet (nth$ (+ 1 (mod (random) (length$ ?petes))) ?petes))
        (bind ?name (fact-slot-value ?somepet name))
        (printout t "I'd suggest you have " ?name ". Does that sound good? (Yes/No)" crlf)
        (bind ?response (read))
        (if (eq ?response Yes)
        then
            (assert (state terminate))
        else
            (clear)
            (reset)
            (assert (state start))))
    (retract ?check)
)
