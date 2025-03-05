;Domain description
(define (domain harbor) ; Domain name must match problem’s
; Define what the planner must support to execute this domain

 (:requirements
 :strips ; basic preconditions and effects
 :negative-preconditions ; to use not in preconditions;
 :equality ;to use = in preconditions
 :disjunctive-preconditions ;to use or in preconditions
 :typing ;to use types
 )
 
 (:types
 dock
 container
 robot
 )
 
 (:predicates
(connected ?d1 - dock ?d2 - dock) ; Docks ?d1 and ?d2 are connected
(ondock ?c - container ?d - dock) ;Container ?c is located at dock ?d
(robot-at ?r - robot ?d - dock) ;Robot ?r is at dock ?d
(carrying ?r - robot ?c - container) ;Robot ?r is carrying container ?c
(free ?r - robot) ;Robot ?r is not carrying a container
(on ?base - container ?top - container) ;Container ?c2 is on top of container ?c1
(clear ?c - container) ;Container has no other container on top of it
)

 (:action move
:parameters (?r - robot ?from - dock ?to - dock)
:precondition (and (robot-at ?r ?from) (connected ?from ?to))
:effect (and (not (robot-at ?r ?from)) (robot-at ?r ?to))
 )
 
 (:action pickup
 :parameters (?r - robot ?c - container ?d - dock)
 :precondition (and (robot-at ?r ?d) (free ?r) (ondock ?c ?d) (clear ?c))
 :effect (and (not (ondock ?c ?d)) (not (clear ?c)) (carrying ?r ?c) (not (free ?r)))
 )
 
 (:action drop
 :parameters (?r - robot ?c - container ?d - dock)
 :precondition (and (robot-at ?r ?d) (carrying ?r ?c) (not (free ?r)))
 :effect (and (not (carrying ?r ?c)) (ondock ?c ?d) (clear ?c) (free ?r))
 )
 
 (:action stack
 :parameters (?r - robot ?base - container ?top - container ?d - dock)
 :precondition (and (robot-at ?r ?d) (carrying ?r ?top) (not (free ?r)) (ondock ?base ?d) (clear ?base))
 :effect (and (not (carrying ?r ?top)) (on ?base ?top) (not (clear ?base)) (clear ?top) (free ?r))
 )
 
 (:action unstack
  :parameters (?r - robot ?base - container ?top - container ?d - dock)
  :precondition (and (robot-at ?r ?d) (on ?base ?top) (clear ?top) (free ?r) (ondock ?base ?d))
  :effect (and (not (on ?base ?top)) (carrying ?r ?top) (clear ?base) (not (free ?r)))
  )            
)