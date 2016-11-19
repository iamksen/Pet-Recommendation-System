(defrule GetBudget
   (declare (salience 92))
	 ?state <- (state question)
   (not (asked budget))
   =>
   (printout t "Please Enter your Budget(Small(s)/Medium(m)/Large(l)/Dont Know(dn)) : " )
   (bind ?response (read))
   (assert (budget ?response))	  
	 (switch ?response
        (case s then (assert (preference (property budget) (symbolValue s))))
        (case m then (assert (preference (property budget) (symbolValue m))))
        (case l then (assert (preference (property budget) (symbolValue l))))
        (default (printout t "Great, so I'll search across a wide range of budgets!" crlf))
		)		
   (assert (asked budget))
)

(defrule process-Budget
    (declare (salience 87))
    (preference (property budget) (symbolValue ?preferred))
	(not (preference (symbolValue dn)))
    ?pet <- (pet (budget ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?pet))
)

(defrule check-after-Budget
    (declare (salience 85))
    (preference (property budget))
    (not (checked-after budget))
    =>
    (assert (check-remaining))
    (assert (checked-after budget))
)

(defrule GetSpace
   (declare (salience 80))
	 ?state <- (state question)
   (not (asked space))
   =>
   (printout t "Please Enter your size of Living Space(Small(s)/Medium(m)/Large(l)/Dont Know(dn)) : " )
   (bind ?response (read))
	 (switch ?response
        (case s then (assert (preference (property space) (symbolValue s))))
        (case m then (assert (preference (property space) (symbolValue m))))
        (case l then (assert (preference (property space) (symbolValue l))))
        (default (printout t "Great, so I'll search across a wide range of spaces!" crlf))
	  )
   (assert (space ?response))
   (assert (asked space))
)

(defrule process-Space
    (declare (salience 75))
    (preference (property space) (symbolValue ?preferred))
		(not (preference (symbolValue dn)))
    ?pet <- (pet (space ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?pet))
)

(defrule check-after-Space
    (declare (salience 73))
    (preference (property space))
    (not (checked-after space))
    =>
    (assert (check-remaining))
    (assert (checked-after space))
)

(defrule GetTime
   (declare (salience 68))
	 ?state <- (state question)
   (not (asked time))
   =>
   (printout t "How much time are you willing to spend with your pet(Small(s)/Medium(m)/Large(l)/Dont Know(dn)): " )
   (bind ?response (read))
	 (switch ?response
        (case s then (assert (preference (property time) (symbolValue s))))
        (case m then (assert (preference (property time) (symbolValue m))))
        (case l then (assert (preference (property time) (symbolValue l))))
        (default (printout t "Great, so I'll search across a wide range of lifestyles!" crlf))
		)
   (assert (time ?response))
   (assert (asked time))
)

(defrule process-Time
    (declare (salience 63))
    (preference (property time) (symbolValue ?preferred))
		(not (preference (symbolValue dn)))
    ?pet <- (pet (time ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?pet))
		
)

(defrule check-after-Time
    (declare (salience 61))
    (preference (property time))  
		(not (checked-after1 time))
    =>
    (assert (check-remaining))
    (assert (checked-after1 time))
)

(defrule GetFamily
   (declare (salience 57))
   ?state <- (state question)
   (not (asked family))
   =>
   (printout t "What kind of pet would you like to keep(Mammal(m)/Bird or Aerial(b)/Reptile(r)/Aquatic(q)/Amphibian(a)/Invertibrate(i)/Dont Know(dn))) : " )
   (bind ?response (read))
   (switch ?response
        (case m then (assert (preference (property family) (symbolValue m))))
        (case b then (assert (preference (property family) (symbolValue b))))
        (case r then (assert (preference (property family) (symbolValue r))))
        (case a then (assert (preference (property family) (symbolValue a))))
        (case q then (assert (preference (property family) (symbolValue q))))
        (case i then (assert (preference (property family) (symbolValue i))))
        (default (printout t "Great, so I'll search across a wide range of animal families!" crlf))
    )
		
   (assert (family ?response))
   (assert (asked family))
)

(defrule process-Family
    (declare (salience 55))
    (preference (property family) (symbolValue ?preferred))
		(not (preference (symbolValue dn)))
    ?pet <- (pet (family ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?pet))
    
)

(defrule check-after-Family
    (declare (salience 53))
    (preference (property family))  
    ?state <- (state question)
    (not (checked-after1 family))
    =>
    (assert (check-remaining))
    (assert (checked-after1 family))
)

(defrule GetMammalian
    (declare (salience 51))
    (preference (property family) (symbolValue m))  
    (not (checked-after2 mammal))
    =>
    (printout t "Oh! So you'd like to choose a mammal eh? I can help you there! Kindly provide with just a few more details" crlf)
    (printout t "Say, what kind of mammal would you like?(Feline-Cat Like(f)/Canine-Dog Like(c)/Bovine-Domesticated(b)/Rodent(r)/Primate(p)/Horned(h)/Carnivora(ca)/Dont Know(dn)" crlf)
    (bind ?response (read))
    (switch ?response
        (case f then (assert (preference (property clade) (symbolValue f))))
        (case c then (assert (preference (property clade) (symbolValue c))))
        (case b then (assert (preference (property clade) (symbolValue b))))
        (case r then (assert (preference (property clade) (symbolValue r))))
        (case p then (assert (preference (property clade) (symbolValue p))))
        (case h then (assert (preference (property clade) (symbolValue h))))
        (case ca then (assert (preference (property clade) (symbolValue ca))))
        (default (printout t "Seems you didnt like zoology much. Thats ok....everybody likes what I'm about to offer...." crlf))
    )
    (assert (checked-after2 mammal))
    (assert (clade ?response))
) 

(defrule process-Mammalia
    (declare (salience 49))
    (preference (property clade) (symbolValue ?preferred))
    (not (preference (symbolValue dn)))
    ?pet <- (pet (clade ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?pet))
    
)

(defrule check-after-Mammalia
    (declare (salience 47))
    (preference (property clade))  
    (not (checked-after clade))
    =>
    (assert (check-remaining))
    (assert (checked-after clade))
)

(defrule GetAerial
    (declare (salience 51))
    (preference (property family) (symbolValue b))  
    (not (checked-after2 aerial))
    =>
    (printout t "Oh! So you'd like to choose an aerial specie eh? I can help you there! Kindly provide with just a few more details" crlf)
    (printout t "Say, what kind of 'flappy' bird would you like?(Perched-Caged(p)/Flight-Glide(f)/Flightless(fl)/Dont Know(dn)" crlf)
    (bind ?response (read))
    (switch ?response
        (case p then (assert (preference (property clade) (symbolValue p))))
        (case f then (assert (preference (property clade) (symbolValue f))))
        (case fl then (assert (preference (property clade) (symbolValue fl))))
        (default (printout t "Seems like you didnt like zoology much. Thats ok....everybody likes what I'm about to offer...." crlf))
    )
    (assert (checked-after2 aerial))
    (assert (clade ?response))
) 

(defrule process-Aerial
    (declare (salience 49))
    (preference (property clade) (symbolValue ?preferred))
    (not (preference (symbolValue dn)))
    ?pet <- (pet (clade ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?pet))
    
)

(defrule check-after-Aerial
    (declare (salience 47))
    (preference (property clade))  
    (not (checked-after clade))
    =>
    (assert (check-remaining))
    (assert (checked-after clade))
)

(defrule GetAqua
    (declare (salience 51))
    (preference (property family) (symbolValue q))  
    (not (checked-after2 aqua))
    =>
    (printout t "Oh! So you'd like to choose an aquatic specie eh? I can help you there! Kindly provide with just a few more details" crlf)
    (printout t "So, where would you house your pet?(Tank(t)/Pool(p)/Aquarium(a)/Dont Know(dn)" crlf)
    (bind ?response (read))
    (switch ?response
        (case t then (assert (preference (property clade) (symbolValue p))))
        (case p then (assert (preference (property clade) (symbolValue l))))
        (case a then (assert (preference (property clade) (symbolValue g))))
        (default (printout t "Seems like you didnt like zoology much. Thats ok....everybody likes what I'm about to offer...." crlf))
    )
    (assert (checked-after2 aqua))
    (assert (clade ?response))
) 

(defrule process-Aqua
    (declare (salience 49))
    (preference (property clade) (symbolValue ?preferred))
    (not (preference (symbolValue dn)))
    ?pet <- (pet (clade ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?pet))
    
)

(defrule check-after-Aqua
    (declare (salience 47))
    (preference (property clade))  
    (not (checked-after clade))
    =>
    (assert (check-remaining))
    (assert (checked-after clade))
)

(defrule GetAmphi
    (declare (salience 51))
    (preference (property family) (symbolValue a))  
    (not (checked-after2 amphi))
    =>
    (printout t "Oh! So you'd like to choose an amphibian specie eh? I can help you there! Kindly provide with just a few more details" crlf)
    (printout t "So, where would you house your pet?(Tank(t)/Marshy-Tank(m)/Aquarium(a)/Dont Know(dn)" crlf)
    (bind ?response (read))
    (switch ?response
        (case t then (assert (preference (property clade) (symbolValue p))))
        (case m then (assert (preference (property clade) (symbolValue l))))
        (case a then (assert (preference (property clade) (symbolValue g))))
        (default (printout t "Seems like you didnt like zoology much. Thats ok....everybody likes what I'm about to offer...." crlf))
    )
    (assert (checked-after2 amphi))
    (assert (clade ?response))
) 

(defrule process-Amphi
    (declare (salience 49))
    (preference (property clade) (symbolValue ?preferred))
    (not (preference (symbolValue dn)))
    ?pet <- (pet (clade ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?pet))
    
)

(defrule check-after-Amphi
    (declare (salience 47))
    (preference (property clade))  
    (not (checked-after clade))
    =>
    (assert (check-remaining))
    (assert (checked-after clade))
)

(defrule GetCoward
    (declare (salience 51))
    (preference (property family) (symbolValue i))  
    (not (checked-after2 coward))
    =>
    (printout t "Oh! So you'd like to choose an invertibrate eh? I can help you there! Kindly provide with just a few more details" crlf)
    (printout t "Most people prefer 6 legs on their invertibrates. Can we say the same about you? Choose wisely(Legless(ll)/Six-Legged(sl)/Eight-Legged(el)/Many-Legged(>8)(ml) /Dont Know(dn)" crlf)
    (bind ?response (read))
    (switch ?response
        (case ll then (assert (preference (property clade) (symbolValue ll))))
        (case sl then (assert (preference (property clade) (symbolValue sl))))
        (case el then (assert (preference (property clade) (symbolValue el))))
        (case ml then (assert (preference (property clade) (symbolValue ml))))
        (default (printout t "Seems like you didnt like zoology much. Thats ok....everybody likes what I'm about to offer...." crlf))
    )
    (assert (checked-after2 coward))
    (assert (clade ?response))
) 

(defrule process-Coward
    (declare (salience 49))
    (preference (property clade) (symbolValue ?preferred))
    (not (preference (symbolValue dn)))
    ?pet <- (pet (clade ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?pet))
    
)

(defrule check-after-Coward
    (declare (salience 47))
    (preference (property clade))  
    (not (checked-after clade))
    =>
    (assert (check-remaining))
    (assert (checked-after clade))
)

(defrule GetRepta
    (declare (salience 51))
    (preference (property family) (symbolValue r))  
    (not (checked-after2 reptile))
    =>
    (printout t "Oh! So you'd like to choose a reptile eh? I can help you there! Kindly provide with just a few more details" crlf)
    (printout t "Would you prefer if your pet slides...or walks?(Slither(s)/Walks(w)/Dont Know(dn))" crlf)
    (bind ?response (read))
    (switch ?response
        (case s then (assert (preference (property clade) (symbolValue s))))
        (case w then (assert (preference (property clade) (symbolValue w))))
        (default (printout t "Seems like you didnt like zoology much. Thats ok....everybody likes what I'm about to offer...." crlf))
    )
    (assert (checked-after2 reptile))
    (assert (clade ?response))
) 

(defrule process-Repta
    (declare (salience 49))
    (preference (property clade) (symbolValue ?preferred))
    (not (preference (symbolValue dn)))
    ?pet <- (pet (clade ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?pet))   
)

(defrule check-after-Repta
    (declare (salience 47))
    (preference (property clade))  
    (not (checked-after clade))
    =>
    (assert (check-remaining))
    (assert (checked-after clade))
)

(defrule GetLifespan
   (declare (salience 45))
   ?state <- (state question)
   (not (asked lifespan))
   =>
   (printout t "Expected Lifespan of the pet?(Small- <2 yrs(s)/Average- 2<yrs<10(a)/Above Average- 10<yrs<30(v)/Large- 30<yrs<60(l)/Very Large- >60yrs(vl)/Dont Know(dn)) : " )
   (bind ?response (read))
   (switch ?response
        (case s then (assert (preference (property lifespan) (symbolValue es))))
        (case a then (assert (preference (property lifespan) (symbolValue s))))
        (case v then (assert (preference (property lifespan) (symbolValue m))))
        (case l then (assert (preference (property lifespan) (symbolValue l))))
        (case vl then (assert (preference (property lifespan) (symbolValue el))))
        (default (printout t "Great, so I'll search across a wide range of animal lifespans!" crlf))
    )
		
   (assert (lifespan ?response))
   (assert (asked lifespan))
)

(defrule process-Lifespan
    (declare (salience 43))
    (preference (property lifespan) (symbolValue ?preferred))
		(not (preference (symbolValue dn)))
    ?pet <- (pet (lifespan ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?pet))
    
)

(defrule check-after-Lifespan
    (declare (salience 41))
    (preference (property lifespan))  
    ?state <- (state question)
    (not (checked-after1 lifespan))
    =>
    (assert (check-remaining))
    (assert (checked-after1 lifespan))
)

(defrule GetColor
   (declare (salience 39))
   ?state <- (state question)
   (not (asked color))
   =>
   (printout t "Which colored pet would you like?(Black(b)/White(w)/Silver(s)/Red(r)/Yellow(y)/Green(g)/Orange(o)/Brown(br)/Dont Know(dn)) : " )
   (bind ?response (read))
   (switch ?response
        (case b then (assert (preference (property color) (symbolValue b))))
        (case w then (assert (preference (property color) (symbolValue w))))
        (case s then (assert (preference (property color) (symbolValue s))))
        (case r then (assert (preference (property color) (symbolValue r))))
        (case y then (assert (preference (property color) (symbolValue y))))
        (case g then (assert (preference (property color) (symbolValue g))))
        (case o then (assert (preference (property color) (symbolValue o))))
        (case br then (assert (preference (property color) (symbolValue br))))
        (default (printout t "Great, so I'll search across a wide range of animal lifespans!" crlf))
    )       
   (assert (color ?response))
   (assert (asked color))
   (retract ?state)
   (assert (state suggest))
   (assert (asked all))
)

(defrule process-Color
    (declare (salience 37))
    (preference (property color) (symbolValue ?preferred))
    (not (preference (symbolValue dn)))
    ?pet <- (pet (color ?found))
    =>
    (if (not (eq ?preferred ?found))
    then
        (retract ?pet))   
)

(defrule check-after-Color
    (declare (salience 35))
    (preference (property color))  
    ?state <- (state question)
    (not (checked-after1 color))
    =>
    (assert (check-remaining))
    (assert (checked-after1 color))
)

(defrule out-of-questions
    (declare (salience 6))
    ?state <- (state question)
    (asked all)
    =>
    (retract ?state)
    (assert (state suggest))
)
