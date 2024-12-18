 Use = to compare numbers
; use equal? to compare anything else (e.g., strings, lists)
; Helper function - do not change
(define (mydisplay value)
(display value)
(newline)
#t
)
; ================================================================
; Test data (constants) for the last two exercises - do not change
; Adapted from community.tableau.com
; These are order numbers that were returned. Revenue and profit do not count
toward totals.
(define RETURNS '(998 1412))
; Format of indiviudal sales
; (orderNum (unitPrice grossSale discount profit) (orderDate shipDate) (province
deliveryMethod) product)
(define SALES '(
(3 (38.94 261.54 0.04 -213.25) ("10/13/2010" "10/20/2010") ("Nunavut" "Regular
Air") "Eldon Base for stackable storage shelf, platinum")
(293 (208.16 10123.02 0.07 457.81) ("10/1/2012" "10/2/2012") ("Northwest
Territories" "Delivery Truck") "1.7 Cubic Foot Compact Cube Office Refrigerators")
(995 (39.89 1815.49 0.03 782.91) ("5/30/2011" "5/31/2011") ("Nunavut" "Regular
Air") "Ultra Commercial Grade Dual Valve Door Closer")
(998 (15.74 248.26 0.07 93.8) ("11/25/2009" "11/26/2009") ("Nunavut" "Regular
Air") "#10-4 1/8 x 9 1/2 Premium Diagonal Seam Envelopes")
(1154 (100.98 4462.23 0.04 440.72) ("2/14/2012" "2/16/2012") ("Nunavut" "Delivery
Truck") "Hon 4-Shelf Metal Bookcases")
(1154 (71.37 663.784 0.25 -481.04) ("2/14/2012" "2/16/2012") ("Nunavut" "Regular
Air") "Lesro Sheffield Collection Coffee Table, End Table, Center Table, Corner
Table")
(1412 (3.69 59.03 0.1 26.92) ("3/12/2010" "3/14/2010") ("Nunavut" "Express Air")
"Avery 52")
(1412 (4.71 97.48 0.05 -5.77) ("3/12/2010" "3/14/2010") ("Nunavut" "Regular Air")
"Plymouth Boxed Rubber Bands by Plymouth")
(23584 (200.97 2671.21 0.06636.18) ("3/12/2012" "3/14/2012") ("Northwest
Territories" "Delivery Truck") "Hewlett-Packard Deskjet 6122 Color Inkjet Printer")
(31270 (299.05 6806.66 0 801.72) ("11/23/2012" "11/24/2012") ("Northwest
Territories" "Delivery Truck") "Global Comet Stacking Armless Chair")
(31270 (291.73 891.61 0.1 -328.36) ("11/23/2012" "11/25/2012") ("Northwest
Territories" "Delivery Truck") "Hon 4070 Series Pagoda Armless Upholstered Stacking
Chairs")
(31270 (30.42 165.04 0.03 -112.44) ("11/23/2012" "11/25/2012") ("Northwest
Territories" "Regular Air") "Fellowes Internet Keyboard, Platinum")
(44099 (367.99 11823.52 0.1 4592.74) ("3/12/2012" "3/14/2012") ("British Columbia"
"Regular Air") "Ibico Ibimaster 300 Manual Binding System")
(44099 (4.24 80.81 0.1 -67.46) ("3/12/2012" "3/14/2012") ("British Columbia"
"Regular Air") "Storex DuraTech Recycled Plastic Frosted Binders")
(56001 (6.48 118.36 0.08 -60.65) ("4/12/2010" "4/16/2010") ("British Columbia"
"Express Air") "Xerox 210")
(26756 (30.97 767.26 0.07 -29.56) ("5/10/2012" "5/10/2012") ("British Columbia"
"Regular Air") "Microsoft Multimedia Keyboard")
(26756 (6.48 253.89 0.09 -103.77) ("5/10/2012" "5/12/2012") ("British Columbia"
"Regular Air") "Xerox 1894")
(26756 (6.48 127.9 0.07 -80.41) ("5/10/2012" "5/12/2012") ("British Columbia"
"Regular Air") "Xerox 210")
(54177 (42.8 480.73 0.1 148.2) ("1/25/2012" "1/25/2012")("Ontario" "Regular Air")
"Wilson Jones Elliptical Ring 3 1/2 Capacity Binders, 800 sheets")
(54177 (6.48 159 0.1 -98.15) ("1/25/2012" "1/27/2012") ("Ontario" "Regular Air")
"Xerox 210")
(55107 (5.68 171.52 0.1 46.61) ("5/8/2010" "5/13/2010") ("Ontario" "Regular Air")
"Staples Standard Envelopes")
)
)
; ================================================================
; Returns a list containing the original list's values divided by c.
; If c equals 0, return #f
; *** You are required to use the built-in function map in your solution! ***
; lst is a flat list of integers and c is an integer
(define (divideIt lst c)
; TODO: Fill this in
; use map
(if (= c 0)
#f
(map (lambda (x) (/ x c)) lst))); stub -- modify accordingly
; Tests
(mydisplay "1. divideIt --------------------------------------")
(mydisplay (divideIt '(10 20 30) 0))
(mydisplay (divideIt '(10 20 30) 5))
; Returns a list containing only the elements divisible by 5 from the
; input list lst
; *** You are required to use the built-in function filter in your solution! ***
; lst is a flat list of integers
(define (divisibleBy5 lst)
; TODO: Fill this in
; use filter
(filter (lambda (x) (= (modulo x 5) 0)) lst)); stub -- modify accordingly
; Tests
(mydisplay "2. divisibleBy5 --------------------------------------")
(mydisplay (divisibleBy5 '(10 21 30 43 45 80)))
(mydisplay (divisibleBy5 '(21 43 22)))
(mydisplay (divisibleBy5 '()))
; Returns the union of two sets. The inputs are flat lists
; of atoms. The result is a flat list containing all the elements
; that appear in at least one of the two lists. No duplicates
; should be present in the result. Order is not important.
; (union '(1 2 3) '(1 3 2)) -> (1 2 3)
; (union '(1 2 3) '(1 2 3 4)) -> (1 2 3 4)
; (union '(1 2) '(3 4)) -> (1 2 3 4)
(define (union lst1 lst2)
; TODO: Fill this in
(define (add-to-set x set)
(if (member x set)
set
(cons x set)))
(define (union-helper lst result)
(if (null? lst)
result
(union-helper (cdr lst) (add-to-set (car lst) result))))
(union-helper lst2 (union-helper lst1 '()))); stub -- modify accordingly
; Tests
(mydisplay "3. union --------------------------------------")
(mydisplay (union '(1 2 3) '(1 3 2)))
(mydisplay (union '(1 2 3) '(1 2 3 4)))
(mydisplay (union '(1 2) '(3 4)))
(mydisplay (union '() '(1 2 3 4)))
; Transform the function below into its tail recursive version
; (define (numOdds lst)
; (if (null? lst)
; 0
; (+ (if (odd? (car lst)) 1 0) (numOdds (cdr lst)))
; )
; )
; The function calculates the number of odd elements appearing in lst
; Recall that the tail recursive version will need a helper function.
(define (numOddsHelper lst partial)
(if (null? lst)
partial
(numOddsHelper (cdr lst)
(+ partial (if (odd? (car lst)) 1 0)))))
(define (numOdds lst)
; TODO: Fill this in
; Use tail recursion
(numOddsHelper lst 0)); stub -- modify accordingly
; Tests
(mydisplay "4. numOdds --------------------------------------")
(mydisplay (numOdds '(1 2 3 4 5 7 8)))
(mydisplay (numOdds '(33 67 88 32 40)))
(mydisplay (numOdds '(2 4 6 8)))
(mydisplay (numOdds '()))
; Returns the set (i.e., list with no duplicates) of order numbers
; that were shipped on a given date.
(define (getOrdersShippedOn date sales)
(define (helper sales acc)
(cond
((null? sales) acc)
((equal? date (cadr (caddr (car sales))))
(helper (cdr sales) (cons (car (car sales)) acc)))
(else (helper (cdr sales) acc))))
(remove-duplicates (helper sales '())))
; Helper function to remove duplicates from a list
(define (remove-duplicates lst)
(define (helper seen rest)
(cond
((null? rest) '())
((member (car rest) seen) (helper seen (cdr rest)))
(else (cons (car rest) (helper (cons (car rest) seen) (cdr rest))))))
(helper '() lst))
; Tests
(mydisplay "5. getOrdersShippedOn --------------------------------")
(mydisplay (getOrdersShippedOn "3/14/2012" SALES))
(mydisplay (getOrdersShippedOn "2/29/2012" SALES))
(mydisplay (getOrdersShippedOn "1/25/2012" SALES))
; Returns the total profit for a given province prov.
; Returned orders (whose order numbers are listed in the returns list)
; should not be included in this calculation!
(define (totalProfitProv prov sales returns)
(define (order-returned? orderNum)
(member orderNum returns))
(define (profit-of-sale sale)
(let ((orderNum (car sale))
(details (cadr sale))
(sale-prov (car (cadddr sale))))
(if (and (equal? sale-prov prov) (not (order-returned? orderNum)))
(cadddr details) ; profit is the fourth element in the details list
0)))
(apply + (map profit-of-sale sales)))
; Tests
(mydisplay "6. totalProfitProv --------------------------------------")
(mydisplay (totalProfitProv "Nunavut" SALES RETURNS))
(mydisplay (totalProfitProv "Ontario" SALES RETURNS))
