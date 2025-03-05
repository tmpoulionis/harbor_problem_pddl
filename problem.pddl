;Problem description
;Describe the objects, the initial state and the goals
(define (problem harbor)
(:domain harbor)
(:objects
d1 d2 d3 - dock
c1 c2 c3 - container
r1 - robot
)
 
(:init
(connected d1 d2) (connected d2 d1) (connected d1 d3) (connected d3 d1)
(ondock c2 d2) (ondock c1 d1)
(on c1 c3)
(robot-at r1 d2) (free r1)
(clear c3) (clear c2)
)

(:goal
(and (robot-at r1 d1) (ondock c2 d3) (ondock c3 d3) (on c2 c1) (free r1) (clear c3) (clear c1))
)

)