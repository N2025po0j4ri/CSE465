; Use = to compare numbers
; Helper function - do not change
(define (mydisplay value)
(display value)
(newline)
#t
)
(define pi 3.14159)
;;; Complete the code for the functions below.
;;; You are allowed to add your own helper functions.
; Calculates the perimeter of a circle with radius r
; The formula for area of a circle is 2 * pi * r
; where pi is defined above on line 11
(define (circlePerimeter r)
(* 2 pi r) ; Calculates the perimeter of a circle
)
(mydisplay "1. circlePerimeter --------------------------------------")
(mydisplay (circlePerimeter 3))
(mydisplay (circlePerimeter 10))
; s1, s2, and s3 represent the lengths of the sides of triangle
; Returns true if s1, s2, and s3 are all equal, and they are all greater than 0.
; Returns false otherwise
(define (isEquilateral s1 s2 s3)
(and (= s1 s2) (= s2 s3) (> s1 0)) ; Checks if all sides are equal and positive
)
(mydisplay "2. isEquilateral --------------------------------------")
(mydisplay (isEquilateral 3 2 2))
(mydisplay (isEquilateral 10 10 10))
(mydisplay (isEquilateral 2 0 7))
(mydisplay (isEquilateral 7 -5 -5))
; Calculates x raised to the power y
; Assume that y is a non-negative number (i.e., y >= 0)
(define (power x y)
; TODO: Fill this in
; Think of a recursive solution
(if (= y 0)
1
(* x (power x (- y 1))))) ; Recursive power function
; stub -- modify it accordingly
; Tests
(mydisplay "3. power --------------------------------------")
(mydisplay (power 3 0))
(mydisplay (power 3 1))
(mydisplay (power 3 2))
(mydisplay (power 3 3))
(mydisplay (power -3 2))
; Returns the average of the values in the list
; and #f if the list is empty
; You may want to create a helper function for sum
(define (sum lst)
(if (null? lst)
0
(+ (car lst) (sum (cdr lst))))) ; Helper function for summing the list
(define (avg lst)
; TODO: Fill this in
(if (null? lst)
#f
(/ (sum lst) (length lst)))) ; Calculates average of the list
; stub -- modify it accordingly
; Tests
(mydisplay "4. avg --------------------------------------")
(mydisplay (avg '(1 2 3)))
(mydisplay (avg '(1 2 1 1 14 1 5 6)))
(mydisplay (avg '()))
(mydisplay (avg '(1)))
(mydisplay (avg '(1 2 -3)))
; Calculates taxes paid based on income
; Let us use the following marginal tax brackets for individual income (2024):
; income of $609,351 or more - 37%
; income from $243,726 to $609,350 - 35%
; income from $191,951 to $243,725 - 32%
; income from $100,526 to $191,950 - 24%
; income from $47,151 to $100,525 - 22%
; income from $11,601 to $47,150 - 12%
; income of $11,600 or below - 10%
; Example:
; If a citizen earns $50,000, they would pay:
; 10% on the first $11,600
; 12% on the next portion of income from $11,601 to $47,150
; 22% on the remaining income above $47,150
; The total tax would be the sum of these amounts.
(define (tax income)
; TODO
(cond ((<= income 11600) (* income 0.10))
((<= income 47150) (+ (* 11600 0.10) (* (- income 11600) 0.12)))
((<= income 100525) (+ (* 11600 0.10) (* 35550 0.12) (* (- income 47150)
0.22)))
((<= income 191950) (+ (* 11600 0.10) (* 35550 0.12) (* 53475 0.22) (* (-
income 100525) 0.24)))
((<= income 243725) (+ (* 11600 0.10) (* 35550 0.12) (* 53475 0.22) (*
91525 0.24) (* (- income 191950) 0.32)))
((<= income 609350) (+ (* 11600 0.10) (* 35550 0.12) (* 53475 0.22) (*
91525 0.24) (* 51975 0.32) (* (- income 243725) 0.35)))
(else (+ (* 11600 0.10) (* 35550 0.12) (* 53475 0.22) (* 91525 0.24) (*
51975 0.32) (* (- income 609350) 0.37))))) ; Calculates tax based on income
brackets
; Tests
(mydisplay "5. tax --------------------------------------")
(mydisplay (tax 7000))
(mydisplay (tax 11600))
(mydisplay (tax 50000))
(mydisplay (tax 600000))
(mydisplay (tax 191950))
; Returns a list containing only those items in list lst that have exactly 2 digits
; Assume that all numbers in lst are positive
; For example (twoDigitsOnly '(123 4 65 785 2 76 900)) should return
; (65 76)
(define (twoDigitsOnly lst)
; TODO: Fill this in
(filter (lambda (x) (and (>= x 10) (< x 100))) lst)) ; Filters for two-digit
numbers
; Tests
(mydisplay "6. twoDigitsOnly --------------------------------------")
(mydisplay (twoDigitsOnly '(123 4 65 785 2 76 900)))
(mydisplay (twoDigitsOnly '(1 41 62 0)))
(mydisplay (twoDigitsOnly '(111 222 3333 44 57685)))
(mydisplay (twoDigitsOnly '()))
(mydisplay (twoDigitsOnly '(123 654 8 1999)))
; The following exercises will use the following format for individual sales
; (orderNum (unitPrice grossSale discount profit) (orderDate shipDate) (province
deliveryMethod) product)
; Returns the unit price information out of a given record for a sale.
; Example:
; (getUnitPrice '(3 (38.94 261.54 0.04 -213.25) ("10/13/2010" "10/20/2010")
; ("Nunavut" "Regular Air") "Eldon Base for stackable storage shelf, platinum")) ->
38.94
(define (getUnitPrice sale)
; TODO: Fill this in
(car (car (cdr sale)))); Extracts the unit price from the sale record
; stub -- modify it accordingly
; Tests
(mydisplay "7. GETUNITPRICE --------------------------------------")
(mydisplay (getUnitPrice '(3 (38.94 261.54 0.04 -213.25) ("10/13/2010"
"10/20/2010") ("Nunavut" "Regular Air") "Eldon Base for stackable storage shelf,
platinum")))
(mydisplay (getUnitPrice '(293 (208.16 10123.02 0.07 457.81 ) ("10/1/2012"
"10/2/2012") ("Northwest Territories" "Delivery Truck") "1.7 Cubic Foot Compact
Cube Office Refrigerators")))
; Returns the province information out of a given record for a sale.
; Example:
; (getProv '(3 (38.94 261.54 0.04 -213.25) ("10/13/2010" "10/20/2010") ("Nunavut"
; "Regular Air") "Eldon Base for stackable storage shelf, platinum")) -> Nunavut
(define (getProv sale)
; TODO: Fill this in
(car ( car( cdr (cdr (cdr sale)))))) ; Extracts the province from the sale record
; Tests
(mydisplay "8. GETPROV --------------------------------------")
(mydisplay (getProv '(3 (38.94 261.54 0.04 -213.25) ("10/13/2010" "10/20/2010")
("Nunavut" "Regular Air") "Eldon Base for stackable storage shelf, platinum")))
(mydisplay (getProv '(293 (208.16 10123.02 0.07 457.81) ("10/1/2012" "10/2/2012")
("Northwest Territories" "Delivery Truck") "1.7 Cubic Foot Compact Cube Office
Refrigerators")))
; Returns true if the profit of a given sale record is a positive number, false
otherwise
; Example:
; (isProfitPos '(3 (38.94 261.54 0.04 -213.25) ("10/13/2010" "10/20/2010")
; ("Nunavut" "Regular Air") "Eldon Base for stackable storage shelf, platinum")) ->
#f
(define (isProfitPos sale)
; TODO: Fill this in
(> (cadddr (cadr sale)) 0)); Checks if profit is positive
; Tests
(mydisplay "9. ISPROFITPOS --------------------------------------")
(mydisplay (isProfitPos '(3 (38.94 261.54 0.04 -213.25) ("10/13/2010" "10/20/2010")
("Nunavut" "Regular Air") "Eldon Base for stackable storage shelf, platinum")))
(mydisplay (isProfitPos '(293 (208.16 10123.02 0.07 457.81) ("10/1/2012"
"10/2/2012") ("Northwest Territories" "Delivery Truck") "1.7 Cubic Foot Compact
Cube Office Refrigerators")))
; Returns a triple consisting of the orderNum, profit, and product information out
; of a given record for a sale.
; Example:
; (getProv '(3 (38.94 261.54 0.04 -213.25) ("10/13/2010" "10/20/2010") ("Nunavut"
; "Regular Air") "Eldon Base for stackable storage shelf, platinum")) -> (3 -213.25
; "Eldon Base for stackable storage shelf, platinum")
(define (getSummary sale)
; TODO: Fill this in
(list (car sale) (cadddr (cadr sale)) (cadr (cdddr sale)))) ; Returns orderNum,
profit, and product information
; Tests
(mydisplay "10. GETSUMMARY --------------------------------------")
(mydisplay (getSummary '(3 (38.94 261.54 0.04 -213.25) ("10/13/2010" "10/20/2010")
("Nunavut" "Regular Air") "Eldon Base for stackable storage shelf, platinum")))
(mydisplay (getSummary '(293 (208.16 10123.02 0.07 457.81) ("10/1/2012"
"10/2/2012") ("Northwest Territories" "Delivery Truck") "1.7 Cubic Foot Compact
Cube Office Refrigerators")))
; Returns a triple consisting of the orderNum, orderDate, and shipDate information
; out of a given record for a sale.
; Example:
; (getProv '(3 (38.94 261.54 0.04 -213.25) ("10/13/2010" "10/20/2010") ("Nunavut"
; "Regular Air") "Eldon Base for stackable storage shelf, platinum")) -> (3
; "10/13/2010" "10/20/2010")
(define (getDatesSummary sale)
; TODO: Fill this in
(list (car sale) (car (caddr sale)) (car (caddr sale)))) ; Returns orderNum,
orderDate, and shipDate
; Tests
(mydisplay "11. GETDATESSUMMARY --------------------------------------")
(mydisplay (getDatesSummary '(3 (38.94 261.54 0.04 -213.25) ("10/13/2010"
"10/20/2010") ("Nunavut" "Regular Air") "Eldon Base for stackable storage shelf,
platinum")))
(mydisplay (getDatesSummary '(293 (208.16 10123.02 0.07 457.81) ("10/1/2012"
"10/2/2012") ("Northwest Territories" "Delivery Truck") "1.7 Cubic Foot Compact
Cube Office Refrigerators")))
; Uncomment the line below if you are using scheme48 on ceclnx01
; ,exit
