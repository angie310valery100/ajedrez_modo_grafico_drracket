#lang racket
(require (lib "graphics.ss" "graphics"))
(open-graphics)
(define abrazo (open-viewport "Ajedrez" 600 600))
; el nombre de las fichas en la cadena
(define cadena (string-copy " T1C1A1DBRBA2C2T2P1P2P3P4P5P6P7P8                                                                p1p2p3p4p5p6p7p8t1c1a1dnrna2c2t2"))
(define click 0)
(define click2 0)
(define fi 0)
(define ci 0)
(define ff 0)
(define cf 0)
(define z 0)
(define turno 1)
(define destino 0)
(define p 0)
(define t 0)
(define ficha (string-copy ""))


((draw-solid-rectangle abrazo)(make-posn 0 0) 600 600 "brown")
;dibuja el tablero
(define (tablero x y contador)
  ; coloca los nombres que van al rededor del tablero en las posiciones x,y
  ((draw-string abrazo) (make-posn  250 20)  "Fichas Negras")
  ((draw-string abrazo) (make-posn  250 570)  "Fichas Blancas")
  ((draw-string abrazo) (make-posn  100 90)  "     A          B         C          D          E          F          G          H")
  ((draw-string abrazo) (make-posn  80 130)  "1")
  ((draw-string abrazo) (make-posn  80 180)  "2")
  ((draw-string abrazo) (make-posn  80 230)  "3")
  ((draw-string abrazo) (make-posn  80 280)  "4")
  ((draw-string abrazo) (make-posn  80 330)  "5")
  ((draw-string abrazo) (make-posn  80 380)  "6")
  ((draw-string abrazo) (make-posn  80 430)  "7")
  ((draw-string abrazo) (make-posn  80 480)  "8")
  ((draw-rectangle abrazo) (make-posn 99 99) 401 401 "gray")
  ;contador controla el numero de renglones que son 8, cada que contador es impar
  ;salta a un nuevo renglon iniciando a x en 50 para que vuelva a recorrer todas las posiciones
  ;de las filas. cada que y va aumentando es un nuevo renglon que se va a empezar a dibujar y pintar con x
  (if (<= contador 8)
  (if(> x 450)
           (tablero 100 (+ y 50) (+ contador 1))
           (begin
    (if (odd? contador)
           (if (even? (/ x 50))
               (begin
                 ((draw-solid-rectangle abrazo)(make-posn x y)50 50 "gray")
               (tablero (+ x 50) y contador))
               (begin
 ((draw-solid-rectangle abrazo)(make-posn x y)50 50 "blue")
               (tablero (+ x 50) y contador)))
           (begin
    (if (even? (/ x 50))
                 (begin
   ((draw-solid-rectangle abrazo)(make-posn x y)50 50 "blue")
   (tablero (+ x 50) y contador))
(begin
        (tablero (+ x 50) y contador)
((draw-solid-rectangle abrazo)(make-posn x y)50 50 "gray")
        )

)))))
      (void))
  )
(tablero 100 100 1)
; se hace el llamado a las fichas para colocarlas en el tablero
;la primer posicion del primer recuadro empieza en 100 
(((draw-pixmap-posn "fichas_ajedrez/torre_1_negro.gif" 'gif/mask) abrazo) (make-posn 100 100))
(((draw-pixmap-posn "fichas_ajedrez/caballo_1_negro.gif" 'gif/mask) abrazo) (make-posn 150 100))
(((draw-pixmap-posn "fichas_ajedrez/alfil_1_negro.gif" 'gif/mask) abrazo) (make-posn 200 100))
(((draw-pixmap-posn "fichas_ajedrez/dama_1_negra.gif" 'gif/mask) abrazo) (make-posn 250 100))
(((draw-pixmap-posn "fichas_ajedrez/rey_1_negro.gif" 'gif/mask) abrazo) (make-posn 300 100))
(((draw-pixmap-posn "fichas_ajedrez/alfil_2_negro.gif" 'gif/mask) abrazo) (make-posn 350 100))
(((draw-pixmap-posn "fichas_ajedrez/caballo_2_negro.gif" 'gif/mask) abrazo) (make-posn 400 100))
(((draw-pixmap-posn "fichas_ajedrez/torre_2_negro.gif" 'gif/mask) abrazo) (make-posn 450 100))
(((draw-pixmap-posn "fichas_ajedrez/peon negro.gif" 'gif/mask) abrazo) (make-posn 100 150))
(((draw-pixmap-posn "fichas_ajedrez/peon negro.gif" 'gif/mask) abrazo) (make-posn 150 150))
(((draw-pixmap-posn "fichas_ajedrez/peon negro.gif" 'gif/mask) abrazo) (make-posn 200 150))
(((draw-pixmap-posn "fichas_ajedrez/peon negro.gif" 'gif/mask) abrazo) (make-posn 250 150))
(((draw-pixmap-posn "fichas_ajedrez/peon negro.gif" 'gif/mask) abrazo) (make-posn 300 150))
(((draw-pixmap-posn "fichas_ajedrez/peon negro.gif" 'gif/mask) abrazo) (make-posn 350 150))
(((draw-pixmap-posn "fichas_ajedrez/peon negro.gif" 'gif/mask) abrazo) (make-posn 400 150))
(((draw-pixmap-posn "fichas_ajedrez/peon negro.gif" 'gif/mask) abrazo) (make-posn 450 150))
;-----------------------------------fichas blancas-------------------------------------------------------------------
(((draw-pixmap-posn "fichas_ajedrez/peon blanco.gif" 'gif/mask) abrazo) (make-posn 100 400))
(((draw-pixmap-posn "fichas_ajedrez/peon blanco.gif" 'gif/mask) abrazo) (make-posn 150 400))
(((draw-pixmap-posn "fichas_ajedrez/peon blanco.gif" 'gif/mask) abrazo) (make-posn 200 400))
(((draw-pixmap-posn "fichas_ajedrez/peon blanco.gif" 'gif/mask) abrazo) (make-posn 250 400))
(((draw-pixmap-posn "fichas_ajedrez/peon blanco.gif" 'gif/mask) abrazo) (make-posn 300 400))
(((draw-pixmap-posn "fichas_ajedrez/peon blanco.gif" 'gif/mask) abrazo) (make-posn 350 400))
(((draw-pixmap-posn "fichas_ajedrez/peon blanco.gif" 'gif/mask) abrazo) (make-posn 400 400))
(((draw-pixmap-posn "fichas_ajedrez/peon blanco.gif" 'gif/mask) abrazo) (make-posn 450 400))
(((draw-pixmap-posn "fichas_ajedrez/torre_1_blanca.gif" 'gif/mask) abrazo) (make-posn 100 450))
(((draw-pixmap-posn "fichas_ajedrez/caballo_1_blanco.gif" 'gif/mask) abrazo) (make-posn 150 450))
(((draw-pixmap-posn "fichas_ajedrez/alfil_1_blanco.gif" 'gif/mask) abrazo) (make-posn 200 450))
(((draw-pixmap-posn "fichas_ajedrez/dama_1_blanca.gif" 'gif/mask) abrazo) (make-posn 250 450))
(((draw-pixmap-posn "fichas_ajedrez/rey_1_blanco.gif" 'gif/mask) abrazo) (make-posn 300 450))
(((draw-pixmap-posn "fichas_ajedrez/alfil_2_blanco.gif" 'gif/mask) abrazo) (make-posn 350 450))
(((draw-pixmap-posn "fichas_ajedrez/caballo_2_blanco.gif" 'gif/mask) abrazo) (make-posn 400 450))
(((draw-pixmap-posn "fichas_ajedrez/torre_2_blanca.gif" 'gif/mask) abrazo) (make-posn 450 450))



;esta es la funcion principal que va a hacer el llamado a las funciones auxiliares 
(define (ajedrez)
 
  (inicio)
  (turmo- ficha turno)
  (movimiento ficha ci fi)
   (jaquen destino 1 128)
  (jaqueb destino 1 128)
  (ajedrez))
; la variable z guarda la posicion de la casilla, casilla 1, casilla 2...
;la funcion get-mouse-click me entrega dos cordenadas, una en el eje x y otra en el eje y
;que se guardaran en las variables fi y ci para conocer la posicion en la fila y la columna
;de la ficha que se va a mover 
(define (inicio)
  (set! click 0)
  (set! fi 0)
  (set! ci 0)
  (set! z 0)
  (set! click (get-mouse-click abrazo))
  (set! fi (-(truncate(/ (posn-y (mouse-click-posn click)) 50))1));se extrae la fila inicial de la posicion y
  (set! ci (-(truncate(/ (posn-x (mouse-click-posn click)) 50))1));se extrae la columna inicial de la posicion x)
(if (and (>= fi 1) (<= fi 8) (>= ci 1) (<= ci 8))
    (begin
  (set! z (-(+ (* (- fi 1) 16) (* 2 ci))1))
;--------------------------------busca si la ficha seleccionada por el mouse esta en el tablero---------------------------------------
  ;estas condiciones son para comparar si el nombre en la cadena es igula a la posicion en la casilla
  ;de ser verdadero el nombre se le asignará a la variable  ficha
     (if (equal? "a2" (substring cadena z (+ z 2) ))
        (set! ficha "a2")
     (if (equal? "a1" (substring cadena z (+ z 2)))
        (set! ficha "a1")
     (if (equal? "A1" (substring cadena z (+ z 2)))
        (set! ficha "A1")
     (if (equal? "A2" (substring cadena z (+ z 2)))
        (set! ficha "A2")
     (if (equal? "t1" (substring cadena z (+ z 2)))
        (set! ficha "t1")
     (if (equal? "t2" (substring cadena z (+ z 2)))
        (set! ficha "t2")
     (if (equal? "T1" (substring cadena z (+ z 2)))
        (set! ficha "T1")
     (if (equal? "T2" (substring cadena z (+ z 2)))
        (set! ficha "T2")
     (if (equal? "c1" (substring cadena z (+ z 2)))
        (set! ficha "c1")
     (if (equal? "c2" (substring cadena z (+ z 2)))
        (set! ficha "c2")
     (if (equal? "C1" (substring cadena z (+ z 2)))
        (set! ficha "C1")
     (if (equal? "C2" (substring cadena z (+ z 2)))
       (set! ficha "C2")
     (if (equal? "RB" (substring cadena z (+ z 2)))
       (set! ficha "RB")
     (if (equal? "DB" (substring cadena z (+ z 2)))
       (set! ficha "DB")
     (if (equal? "dn" (substring cadena z (+ z 2)))
       (set! ficha "dn")
     (if (equal? "rn" (substring cadena z (+ z 2)))
       (set! ficha "rn")
     (if (equal? "p1" (substring cadena z (+ z 2)))
       (set! ficha "p1")
     (if (equal? "p2"(substring cadena z (+ z 2)))
       (set! ficha "p2")
     (if (equal? "p3" (substring cadena z (+ z 2)))
       (set! ficha "p3")
     (if (equal? "p4" (substring cadena z (+ z 2)))
       (set! ficha "p4")
     (if (equal? "p5" (substring cadena z (+ z 2)))
       (set! ficha "p5")
     (if (equal? "p6" (substring cadena z (+ z 2)))
       (set! ficha "p6")
     (if (equal? "p7" (substring cadena z (+ z 2)))
       (set! ficha "p7")
     (if (equal? "p8" (substring cadena z (+ z 2)))
       (set! ficha "p8")
     (if (equal? "P1" (substring cadena z (+ z 2)))
       (set! ficha "P1")
     (if (equal? "P2" (substring cadena z (+ z 2)))
       (set! ficha "P2")
     (if (equal? "P3" (substring cadena z (+ z 2)))
       (set! ficha "P3")
     (if (equal? "P4" (substring cadena z (+ z 2)))
       (set! ficha "P4")
     (if (equal? "P5" (substring cadena z (+ z 2)))
       (set! ficha "P5")
     (if (equal? "P6" (substring cadena z (+ z 2)))
       (set! ficha "P6")
     (if (equal? "P7" (substring cadena z (+ z 2)))
       (set! ficha "P7")
     (if (equal? "P8" (substring cadena z (+ z 2)))
       (set! ficha "P8")
     (begin
        ((draw-string abrazo) (make-posn 200 530) "FICHA INEXISTENTE EN EL TABLERO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 200 530) "FICHA INEXISTENTE EN EL TABLERO" "brown")
      (ajedrez)))))))))))))))))))))))))))))))))
           )
      )
     (ajedrez))
      )
; esta funcion define el turno de las fichas donde si turno es impar le corresponde la jugada a las fichas
;blancas, si es par le corresponde a las negras 
(define (turmo- ficha turno)
  (if (odd? turno);define el turno de la ficha 
      (if (or (equal? ficha "p1") (equal? ficha "p2") (equal? ficha "p3") (equal? ficha "p4") (equal? ficha "p5")
              (equal? ficha "p6") (equal? ficha "p7") (equal? ficha "p8") (equal? ficha "t1") (equal? ficha "t2")
              (equal? ficha "c1") (equal? ficha "c2") (equal? ficha "a1") (equal? ficha "a2") (equal? ficha "rn")
              (equal? ficha "dn"))
          (void)
          (begin
        ((draw-string abrazo) (make-posn 250 530) "TURNO DE LAS BLANCAS" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "TURNO DE LAS BLANCAS" "brown")
      (ajedrez)))
     (if (or (equal? ficha "P1") (equal? ficha "P2") (equal? ficha "P3") (equal? ficha "P4") (equal? ficha "P5")
             (equal? ficha "P6") (equal? ficha "P7") (equal? ficha "P8") (equal? ficha "T1") (equal? ficha "T2")
             (equal? ficha "C1") (equal? ficha "C2") (equal? ficha "A1") (equal? ficha "A2") (equal? ficha "DB")
             (equal? ficha "RB"))
         (void)
         (begin
        ((draw-string abrazo) (make-posn 250 530) "TURNO DE LAS NEGRAS" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "TURNO DE LAS NEGRAS" "brown")
      (ajedrez))
         )))
; con la funcion get-mouse-click que entrega dos cordenadas, que nos sirven para la posicion donde que quiere colocar la
;ficha a mover 
(define (movimiento ficha ci fi)
  (set! ff 0)
  (set! cf 0)
  (set! click2 0)
  (set! click2 (get-mouse-click abrazo))
  (set! ff (-(truncate(/(posn-y (mouse-click-posn click2))50))1));guarda la fila final en el segundo click de la posicion y de la ventana
  (set! cf (-(truncate(/(posn-x (mouse-click-posn click2))50))1));guarda la columna final en el segundo click de la posicion x de la ventana
; esta condicion sirva para que el movimiento no se salga del tablero ya que el tablero tiene 8 casillas
  (if (and (>= ff 1) (<= ff 8) (>= cf 1) (<= cf 8));busca si el click seleccionado por el usuario esta dentro del tablero
      (begin
        (reglas-ficha ficha fi ci ff cf)
        ;la variable destino nos entrega la posicion de la casilla, casilla 1, casilla 2...
        (set! destino (-(+ (* (- ff 1) 16) (* 2 cf))1))
        (if (equal? "  " (substring cadena destino (+ destino 2)));evalua si la casilla destino es un espacio en blanco
            (begin
              (string-copy! cadena z "  ")
              (string-copy! cadena destino "  ")
              (string-copy! cadena destino ficha)
               ((draw-solid-rectangle abrazo)(make-posn (* (+ 1 ci) 50)(* (+ 1 fi) 50) ) 49 49 (color))
               ((draw-solid-rectangle abrazo)(make-posn (* (+ 1 cf) 50)(* (+ 1 ff) 50) ) 49 49 (color2))
               (((draw-pixmap-posn (nombre ficha) 'gif/mask) abrazo) (make-posn (* (+ 1 cf) 50) (* (+ 1 ff) 50)))
(set! turno (+ turno 1))
             )
            (if (odd? turno) ;la variable turno toma el control de que no se coman las fichas amigas
  ;-------------------------- si la es impar la variable turno procede a que se coman las negras cuando sea turno de las blancas----------------------------------
                (if (or (equal? "P1" (substring cadena destino (+ destino 2)))
                        (equal? "P2" (substring cadena destino (+ destino 2)))
                        (equal? "P3" (substring cadena destino (+ destino 2)))
                        (equal? "P4" (substring cadena destino (+ destino 2)))
                        (equal? "P5" (substring cadena destino (+ destino 2)))
                        (equal? "P6" (substring cadena destino (+ destino 2)))
                        (equal? "P7" (substring cadena destino (+ destino 2)))
                        (equal? "P8" (substring cadena destino (+ destino 2)))
                        (equal? "T1" (substring cadena destino (+ destino 2)))
                        (equal? "T2" (substring cadena destino (+ destino 2)))
                        (equal? "C1" (substring cadena destino (+ destino 2)))
                        (equal? "C2" (substring cadena destino (+ destino 2)))
                        (equal? "A1" (substring cadena destino (+ destino 2)))
                        (equal? "A2" (substring cadena destino (+ destino 2)))
                        (equal? "RB" (substring cadena destino (+ destino 2)))
                        (equal? "DB" (substring cadena destino (+ destino 2))))
                     (begin ;verdadero
              (string-copy! cadena z "  ")
              (string-copy! cadena destino "  ")
              (string-copy! cadena destino ficha)
               ((draw-solid-rectangle abrazo)(make-posn (* (+ 1 ci) 50)(* (+ 1 fi) 50) ) 49 49 (color))
     ((draw-solid-rectangle abrazo)(make-posn (* (+ 1 cf) 50)(* (+ 1 ff) 50) ) 49 49 (color2))
     (((draw-pixmap-posn (nombre ficha) 'gif/mask) abrazo) (make-posn (* (+ 1 cf) 50) (* (+ 1 ff) 50)))
               (set! turno (+ turno 1))
                     )
                     (ajedrez);falso
                    )
                (if (or (equal? "p1" (substring cadena destino (+ destino 2)))
                        (equal? "p2" (substring cadena destino (+ destino 2)))
                        (equal? "p3" (substring cadena destino (+ destino 2)))
                        (equal? "p4" (substring cadena destino (+ destino 2)))
                        (equal? "p5" (substring cadena destino (+ destino 2)))
                        (equal? "p6" (substring cadena destino (+ destino 2)))
                        (equal? "p7" (substring cadena destino (+ destino 2)))
                        (equal? "p8" (substring cadena destino (+ destino 2)))
                        (equal? "t1" (substring cadena destino (+ destino 2)))
                        (equal? "t2" (substring cadena destino (+ destino 2)))
                        (equal? "c1" (substring cadena destino (+ destino 2)))
                        (equal? "c2" (substring cadena destino (+ destino 2)))
                        (equal? "a1" (substring cadena destino (+ destino 2)))
                        (equal? "a2" (substring cadena destino (+ destino 2)))
                        (equal? "rn" (substring cadena destino (+ destino 2)))
                        (equal? "dn" (substring cadena destino (+ destino 2))))
                    (begin ;verdadero
              (string-copy! cadena z "  ")
              (string-copy! cadena destino "  ")
              (string-copy! cadena destino ficha)
           ((draw-solid-rectangle abrazo)(make-posn (* (+ 1 ci) 50)(* (+ 1 fi) 50) ) 49 49 (color))
     ((draw-solid-rectangle abrazo)(make-posn (* (+ 1 cf) 50)(* (+ 1 ff) 50) ) 49 49 (color2))
     (((draw-pixmap-posn (nombre ficha) 'gif/mask) abrazo) (make-posn (* (+ 1 cf) 50) (* (+ 1 ff) 50)))
                (set! turno (+ turno 1))
                     )
                    (ajedrez);falso
                    )
                )
            )
        )(ajedrez)
      )
  )
(define (reglas-ficha ficha fi ci ff cf)
  (if (or (equal? ficha "T1") (equal? ficha "T2");busca si la ficha seleccionada es la torre 
        (equal? ficha "t1") (equal? ficha "t2"))
(begin

  (if (cond
        ((and (= ci cf) (> fi ff)))
        ((and (= ci cf) (< fi ff)))
        ((and (> ci cf) (= fi ff)))
        ((and (< ci cf) (= fi ff)))
        (else #f)
        )
      (obstruccion fi ci ff cf)
      (begin
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "brown")
      (ajedrez))
      )
  )
    
    (begin
      (if (or (equal? ficha "C1") (equal? ficha "C2") ;busca si la ficha seleccionada es el caballo 
              (equal? ficha "c1") (equal? ficha "c2"))
          (begin
            (if(cond
  ((and (= ff (+ fi 2))(= cf (- ci 1))))
  ((and (= ff (+ fi 2))(= cf (+ ci 1))))
  ((and (= ff (- fi 2))(= cf (- ci 1))))
  ((and (= ff (- fi 2))(= cf (+ ci 1))))
  ((and (= ff (+ fi 1))(= cf (- ci 2))))
  ((and (= ff (- fi 1))(= cf (- ci 2))))
  ((and (= ff (+ fi 1))(= cf (+ ci 2))))
  ((and (= ff (- fi 1))(= cf (+ ci 2))))
  (else #f))
               (void)
               (begin
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "brown")
      (ajedrez)))
            )
          (begin
            (if (or (equal? ficha "A1") (equal? ficha "A2") ;busca si la ficha seleccionada es el alfil
                    (equal? ficha "a1") (equal? ficha "a2"))
                (begin
                  (if (cond ((and (= (abs (- fi ff)) (abs (- ci cf)))))
                      (else #f))
                       (obstruccion fi ci ff cf)
                      (begin
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "brown")
      (ajedrez))
                      ))
                (begin
                  (if (or (equal? ficha "DB")(equal? ficha "dn"));busca si la ficha seleccionada es la reina 
                      (begin
                       (if (cond
        ((and (= ci cf) (> fi ff)))
        ((and (= ci cf) (< fi ff)))
        ((and (> ci cf) (= fi ff)))
        ((and (< ci cf) (= fi ff)))
        ((and (= (abs (- fi ff))(abs (- ci cf)))))
        (else #f))
      (obstruccion fi ci ff cf)
      (begin
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "brown")
      (ajedrez))))
       (begin
      (if (or (equal? ficha "RB") (equal? ficha "rn"));busca si la ficha seleccionada es el rey 
          (begin
            (if (cond
        ((and (= ff (- fi 1)) (= cf (+ ci 1))))
        ((and (= ff (+ fi 1)) (= cf (- ci 1))))
        ((and (= ff (- fi 1)) (= cf (- ci 1))))
        ((and (= ff (+ fi 1)) (= cf (+ ci 1))))
        ((and (= ff fi) (= cf (+ ci 1))))
        ((and (= ff fi) (= cf (- ci 1))))
        ((and (= cf ci) (= ff (+ fi 1))))
        ((and (= cf ci) (= ff (- fi 1))))
        (else #f))
      (void)
      (begin
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "brown")
      (ajedrez)))
            )
          (begin
            (if (or (equal? ficha "P1") (equal? ficha "P2") (equal? ficha "P3");busca si la ficha seleccionada es cualquiera de los peones blancos
                    (equal? ficha "P4") (equal? ficha "P5") (equal? ficha "P6")
                    (equal? ficha "P7") (equal? ficha "P8"))
                (begin
                  (if (= fi 2);evalua si cualquiera de los peones negros se encuentra en la fila 2 para pasar a la fila 3 o 4 
  (begin
            (if(cond
        ((and (= ci cf) (= ff (+ fi 1))))
        ((and (= ci cf) (= ff (+ fi 2))))
        ((or (and (= cf (+ ci 1)) (= ff (+ fi 1)))) (comerpeonn fi ci ff cf))
        ((or (and (= cf (- ci 1)) (= ff (+ fi 1)))) (comerpeonn fi ci ff cf))
        (else #f))
       (obstruccion fi ci ff cf)
       (begin
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "brown")
      (ajedrez))))
  (begin   ;si cualquiera de los peones negros no se encuentran en la fila 2 pasa a evaluar estas funciones  
        (if (cond ((and (= ci cf) (= ff (+ fi 1))))
                  ((or (and (= cf (+ ci 1)) (= ff (+ fi 1)))) (comerpeonn fi ci ff cf))
                  ((or (and (= cf (- ci 1)) (= ff (+ fi 1)))) (comerpeonn fi ci ff cf))
                  (else #f))
        (void)
        (begin
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "brown")
      (ajedrez))
        ))))
                (begin
                  (if (or (equal? ficha "p1") (equal? ficha "p2") (equal? ficha "p3"); busca si la ficha seleccionada es cualquiera de los peones negros
                          (equal? ficha "p4") (equal? ficha "p5") (equal? ficha "p6")
                          (equal? ficha "p7") (equal? ficha "p8"))
                      (begin
                        (if (= fi 7);evalua si cualquiera de los peones blancos se encuentra en la fila 7 para pasar a la fila 6 o 5  
      (begin
      (if(cond
        ((and (= ci cf) (= ff (- fi 1)))#t)
        ((and (= ci cf) (= ff (- fi 2)))#t)
        ((or (and (= cf (+ ci 1)) (= ff (- fi 1)))) (comerpeonb fi ci ff cf))
        ((or (and (= cf (- ci 1)) (= ff (- fi 1)))) (comerpeonb fi ci ff cf))
        (else #f))
       (obstruccion fi ci ff cf)
       (begin
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "brown")
      (ajedrez))
       )
      )
         (begin ; si cualquiera de los peones blancos no se encuentran en la fila 7 pasa a evaluar esta funcion
        (if (cond
              ((and (= ci cf) (= ff (- fi 1))))
              ((or (and (= cf (+ ci 1)) (= ff (- fi 1)))) (comerpeonb fi ci ff cf))
              ((or (and (= cf (- ci 1)) (= ff (- fi 1)))) (comerpeonb fi ci ff cf))
              (else #f))
        (void)
        (begin
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "brown")
      (ajedrez))))))
          (void)))))))))))))))

(define (obstruccion fi ci ff cf)
  (if (and (= ci cf) (> fi ff))
      (begin
      (set! fi (- fi 1))
(paso1 fi ci ff cf))
      (begin
        (if (and (= ci cf) (< fi ff))
            (begin
              (set! fi (+ fi 1))
(paso2 fi ci ff cf))
            (begin
              (if (and (> ci cf ) (= fi ff))
                  (begin
                    (set! ci (- ci 1))
(paso3 fi ci ff cf))
                  (begin
                    (if (and (< ci cf) (= fi ff))
                        (begin
                          (set! ci (+ ci 1))
(paso4 fi ci ff cf))
                        (begin
                          (if (and (< ci cf) (< fi ff))
                              (begin
                                (set! ci (+ ci 1))
                                (set! fi (+ fi 1))
(paso5 fi ci ff cf))
                             
                              (begin
                                (if (and (> ci cf) (> fi ff))
                                    (begin
                                      (set! ci (- ci 1))
                                      (set! fi (- fi 1))
(paso6 fi ci ff cf))
                                    (begin
                                      (if (and (> ci cf) (< fi ff))
                                          (begin
                                            (set! ci (- ci 1))
                                            (set! fi (+ fi 1))
(paso7 fi ci ff cf))
                                          (begin
                                            (if (and (< ci cf) (> fi ff))
                                                (begin
                                                  (set! ci (+ ci 1))
                                                  (set! fi (- fi 1))
(paso8 fi ci ff cf))
                                                (void)))))))))))))))
      )
  )
(define (paso1 fi ci ff cf)
  (if (= fi ff)
      (void)
      (begin
        (set! p (-(+ (* (- fi 1) 16) (* 2 cf))1))
         (if(equal? "  " (substring cadena p (+ 2 p)))
            (begin
             (paso1 (- fi 1) ci ff cf)
             )
                        (begin
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "brown")
      (ajedrez))
             ))))
(define (paso2 fi ci ff cf)
  (if (= fi ff)
      (void )
      (begin
       (set! p (-(+ (* (- fi 1) 16) (* 2 cf))1))
       (if (equal? "  " (substring cadena p (+ 2 p)))
           (begin
             (paso2 (+ fi 1) ci ff cf))
           (begin
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "brown")
      (ajedrez))))))
(define (paso3 fi ci ff cf)
  (if (= ci cf)
      (void)
      (begin
        (set! p (-(+ (* (- ff 1) 16) (* 2 ci))1))
         (if(equal? "  " (substring cadena p (+ 2 p)))
            (begin
             (displayln p)
             (paso3 fi  (- ci 1) ff cf))
                        (begin
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "brown")
      (ajedrez))
             ))))

(define(paso4 fi ci ff cf)
  (if (= ci cf)
      (void )
      (begin
       (set! p (-(+ (* (- fi 1) 16) (* 2 ci))1))
       (if (equal? "  " (substring cadena p (+ 2 p)))
           (begin
             (paso4 fi (+ ci 1) ff cf))
           (begin
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "brown")
      (ajedrez))))))

(define (paso5 fi ci ff cf)
  (if (and (= ci cf) (= fi ff))
      (void)
      (begin
        (set! p (-(+ (* (- fi 1) 16) (* 2 ci))1))
       (if (equal? "  " (substring cadena p (+ 2 p)))
           (begin
             (paso5 (+ fi 1) (+ ci 1) ff cf))
           (begin
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "brown")
      (ajedrez))))))

(define (paso6 fi ci ff cf)
  (if (and (= ci cf) (= fi ff))
      (void)
      (begin
        (set! p (-(+ (* (- fi 1) 16) (* 2 ci))1))
        (if (equal? "  " (substring cadena p (+ 2 p)))
           (begin
             (paso6 (- fi 1) (- ci 1) ff cf))
           (begin
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "brown")
      (ajedrez))))))

(define (paso7 fi ci ff cf)
  (if (and (= ci cf) (= fi ff))
      (void)
      (begin
       (set! p (-(+ (* (- fi 1) 16) (* 2 ci))1))
      (if (equal? "  " (substring cadena p (+ 2 p)))
           (begin
             (paso7 (+ fi 1) (- ci 1) ff cf))
           (begin
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "brown")
      (ajedrez))))))

(define (paso8 fi ci ff cf)
  (if (and (= ci cf) (= fi ff))
      (void)
      (begin
       (set! p (-(+ (* (- fi 1) 16) (* 2 ci))1))
       (if (equal? "  " (substring cadena p (+ 2 p)))
           (begin
             (paso8 (- fi 1) (+ ci 1) ff cf))
           (begin
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "OBSTRUCCION FICHA" "brown")
      (ajedrez))))))

(define (comerpeonn fi ci ff cf)
        (set! t (-(+ (* (- ff 1) 16) (* 2 cf))1))
        (if (or (equal? "p1" (substring cadena t (+ 2 t)))
                (equal? "p2" (substring cadena t (+ 2 t)))
                (equal? "p3" (substring cadena t (+ 2 t)))
                (equal? "p4" (substring cadena t (+ 2 t)))
                (equal? "p5" (substring cadena t (+ 2 t)))
                (equal? "p6" (substring cadena t (+ 2 t)))
                (equal? "p7" (substring cadena t (+ 2 t)))
                (equal? "p8" (substring cadena t (+ 2 t)))
                (equal? "t1" (substring cadena t (+ 2 t)))
                (equal? "t2" (substring cadena t (+ 2 t)))
                (equal? "c1" (substring cadena t (+ 2 t)))
                (equal? "c2" (substring cadena t (+ 2 t)))
                (equal? "a1" (substring cadena t (+ 2 t)))
                (equal? "a2" (substring cadena t (+ 2 t)))
                (equal? "dn" (substring cadena t (+ 2 t)))
                )
     (begin
              (string-copy! cadena z "  ")
              (string-copy! cadena destino "  ")
              (string-copy! cadena destino ficha)
     ((draw-solid-rectangle abrazo)(make-posn (* (+ 1 ci) 50)(* (+ 1 fi) 50) ) 49 49 (color))
     ((draw-solid-rectangle abrazo)(make-posn (* (+ 1 cf) 50)(* (+ 1 ff) 50) ) 49 49 (color2))
     (((draw-pixmap-posn (nombre ficha) 'gif/mask) abrazo) (make-posn (* (+ 1 cf) 50) (* (+ 1 ff) 50)))
     (set! turno (+ turno 1))
     (ajedrez)
      )
             (begin
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "brown")
      (ajedrez))
              ))

(define (comerpeonb fi ci ff cf)
  (set! t (-(+ (* (- ff 1) 16) (* 2 cf))1))
        (if (or (equal? "P1" (substring cadena t (+ 2 t)))
                (equal? "P2" (substring cadena t (+ 2 t)))
                (equal? "P3" (substring cadena t (+ 2 t)))
                (equal? "P4" (substring cadena t (+ 2 t)))
                (equal? "P5" (substring cadena t (+ 2 t)))
                (equal? "P6" (substring cadena t (+ 2 t)))
                (equal? "P7" (substring cadena t (+ 2 t)))
                (equal? "P8" (substring cadena t (+ 2 t)))
                (equal? "T1" (substring cadena t (+ 2 t)))
                (equal? "T2" (substring cadena t (+ 2 t)))
                (equal? "C1" (substring cadena t (+ 2 t)))
                (equal? "C2" (substring cadena t (+ 2 t)))
                (equal? "A1" (substring cadena t (+ 2 t)))
                (equal? "A2" (substring cadena t (+ 2 t)))
                (equal? "DB" (substring cadena t (+ 2 t)))
                )
(begin
              (string-copy! cadena z "  ")
              (string-copy! cadena destino "  ")
              (string-copy! cadena destino ficha)
               ((draw-solid-rectangle abrazo)(make-posn (* (+ 1 ci) 50)(* (+ 1 fi) 50) ) 49 49 (color))
     ((draw-solid-rectangle abrazo)(make-posn (* (+ 1 cf) 50)(* (+ 1 ff) 50) ) 49 49 (color2))
     (((draw-pixmap-posn (nombre ficha) 'gif/mask) abrazo) (make-posn (* (+ 1 cf) 50) (* (+ 1 ff) 50)))
(set! turno (+ turno 1))
             (ajedrez))
(begin
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "MOVIMIENTO INVALIDO" "brown")
      (ajedrez))
              ))

(define (color)
  (if (even? (+ fi ci));todas las posiciones gris del tablero son par 
      "gray"
      "blue"
      )
  )
(define (color2)
  (if (even? (+ ff cf))
      "gray"
      "blue"
      )
  )
(define (nombre ficha)
;--------------------------decide el nombre correcto de cada ficha para al momento de los graficos------------------------
  (cond
    ((equal? ficha "a2") "fichas_ajedrez/alfil_2_blanco.gif")
    ((equal? ficha "a1") "fichas_ajedrez/alfil_1_blanco.gif")
    ((equal? ficha "A1") "fichas_ajedrez/alfil_1_negro.gif")
    ((equal? ficha "A2") "fichas_ajedrez/alfil_2_negro.gif")
    ((equal? ficha "t1") "fichas_ajedrez /torre_1_blanca.gif")
    ((equal? ficha "t2") "fichas_ajedrez/torre_2_blanca.gif")
    ((equal? ficha "T1") "fichas_ajedrez/torre_1_negra.gif")
    ((equal? ficha "T2") "fichas_ajedrez/torre_2_negra.gif")
    ((equal? ficha "C1") "fichas_ajedrez/caballo_1_negro.gif")
    ((equal? ficha "C2") "fichas_ajedrez/caballo_2_negro 2.gif")
    ((equal? ficha "c1") "fichas_ajedrez/caballo_1_blanco.gif")
    ((equal? ficha "c2") "fichas_ajedrez/caballo_2_blanco 2.gif")
    ((equal? ficha "RB") "fichas_ajedrez/rey_1_negro.gif")
    ((equal? ficha "DB") "fichas_ajedrez/dama_1_negra.gif")
    ((equal? ficha "rn") "fichas_ajedrez/rey_1_blanco.gif")
    ((equal? ficha "dn") "fichas_ajedrez/dama_1_blanca.gif")
    ((equal? ficha "p1") "fichas_ajedrez/peon blanco.gif")
    ((equal? ficha "p2") "fichas_ajedrez/peon blanco.gif")
    ((equal? ficha "p3") "fichas_ajedrez/peon blanco.gif")
    ((equal? ficha "p4") "fichas_ajedrez/peon blanco.gif")
    ((equal? ficha "p5") "fichas_ajedrez/peon blanco.gif")
    ((equal? ficha "p6") "fichas_ajedrez/peon blanco.gif")
    ((equal? ficha "p7") "fichas_ajedrez/peon blanco.gif")
    ((equal? ficha "p8") "fichas_ajedrez/peon blanco.gif")
    ((equal? ficha "P1") "fichas_ajedrez/Peon negro.gif")
    ((equal? ficha "P2") "fichas_ajedrez/Peon negro.gif")
    ((equal? ficha "P3") "fichas_ajedrez/Peon negro.gif")
    ((equal? ficha "P4") "fichas_ajedrez/Peon negro.gif")
    ((equal? ficha "P5") "fichas_ajedrez/Peon negro.gif")
    ((equal? ficha "P6") "fichas_ajedrez/Peon negro.gif")
    ((equal? ficha "P7") "fichas_ajedrez/Peon negro.gif")
    ((equal? ficha "P8") "fichas_ajedrez/Peon negro.gif")
    (else #f))
  )

(define (jaquen destino e f)
  (set! ci 0)
  (set! fi 0)
  (set! cf 0)
  (set! ff 0)
 
   (if (<= e f)
       (begin
         (if (equal? "RB" (substring cadena e (+ e 2)))
             (begin
               
               (set! ff (+ (quotient e 16)1))
               (set! cf (/ (+ (remainder e 16)1)2))
               (set! fi (+(quotient destino 16)1))
               (set! ci (/(+(remainder destino 16)1)2))
               (if (equal? "a" (substring cadena destino (+ destino 1)))
                   (begin
                     (if
                      (cond ((and (= (abs (- fi ff)) (abs (- ci cf)))))
                      (else #f))
                       (begin
                         (obstruccion2 fi ci ff cf))
                       (begin
                      (display "f"))
                      ))
                   (if (equal? "t" (substring cadena destino (+ destino 1)))
                       (begin
                (if (cond
        ((and (= ci cf) (> fi ff)))
        ((and (= ci cf) (< fi ff)))
        ((and (> ci cf) (= fi ff)))
        ((and (< ci cf) (= fi ff)))
        (else #f)
        )
      (obstruccion2 fi ci ff cf)
      (begin
        (void))
      ))
         (if (equal? "c" (substring cadena destino (+ destino 1)))
             (begin
              (if
               (cond
  ((and (= ff (+ fi 2))(= cf (- ci 1))))
  ((and (= ff (+ fi 2))(= cf (+ ci 1))))
  ((and (= ff (- fi 2))(= cf (- ci 1))))
  ((and (= ff (- fi 2))(= cf (+ ci 1))))
  ((and (= ff (+ fi 1))(= cf (- ci 2))))
  ((and (= ff (- fi 1))(= cf (- ci 2))))
  ((and (= ff (+ fi 1))(= cf (+ ci 2))))
  ((and (= ff (- fi 1))(= cf (+ ci 2))))
  (else #f))
              (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
               (begin
                 (void))
               ))
             (if (equal? "dn" (substring cadena destino (+ destino 2)))
                 (begin
                   (if (cond
        ((and (= ci cf) (> fi ff)))
        ((and (= ci cf) (< fi ff)))
        ((and (> ci cf) (= fi ff)))
        ((and (< ci cf) (= fi ff)))
        ((and (= (abs (- fi ff))(abs (- ci cf)))))
        (else #f))
      (obstruccion2 fi ci ff cf)
      (begin
        (void)
        )))
                 (if (equal? "rn" (substring cadena destino (+ destino 2)))
                     (begin
                       (if (cond
        ((and (= ff (- fi 1)) (= cf (+ ci 1))))
        ((and (= ff (+ fi 1)) (= cf (- ci 1))))
        ((and (= ff (- fi 1)) (= cf (- ci 1))))
        ((and (= ff (+ fi 1)) (= cf (+ ci 1))))
        ((and (= ff fi) (= cf (+ ci 1))))
        ((and (= ff fi) (= cf (- ci 1))))
        ((and (= cf ci) (= ff (+ fi 1))))
        ((and (= cf ci) (= ff (- fi 1))))
        (else #f))
      (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
      (begin
        (void)
        )))
                     (if (equal? "p" (substring cadena destino (+ destino 1)))
                         (begin
             (if
                (cond
              
              ((or (and (= cf (+ ci 1)) (= ff (- fi 1)))))
              ((or (and (= cf (- ci 1)) (= ff (- fi 1)))))
              (else #f))
        (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
        (begin
          (void))))
                         (void))))))
                   )
               )
             (jaquen destino (+ e 2) f)))
       (void))
  )

(define (jaqueb destino e f)
  (set! ci 0)
  (set! fi 0)
  (set! cf 0)
  (set! ff 0)
   (if (<= e f)
       (begin
         (if (equal? "rn" (substring cadena e (+ e 2)))
             (begin
           
               (set! ff (+(quotient e 16)1))
               (set! cf (/(+(remainder e 16)1)2))
               (set! fi (+(quotient destino 16)1))
               (set! ci (/(+(remainder destino 16)1)2))
               (if (equal? "A" (substring cadena destino (+ destino 1)))
                   (begin (if (cond ((and (= (abs (- fi ff)) (abs (- ci cf)))))
                      (else #f))
                       (begin
                         (obstruccion2 fi ci ff cf))
                       (begin
                      (void))
                      ))
                   (if (equal? "T" (substring cadena destino (+ destino 1)))
                       (begin
                (if (cond
        ((and (= ci cf) (> fi ff)))
        ((and (= ci cf) (< fi ff)))
        ((and (> ci cf) (= fi ff)))
        ((and (< ci cf) (= fi ff)))
        (else #f)
        )
      (obstruccion2 fi ci ff cf)
      (begin
        (void))
      ))
         (if (equal? "C" (substring cadena destino (+ destino 1)))
             (begin
              (if
               (cond
  ((and (= ff (+ fi 2))(= cf (- ci 1))))
  ((and (= ff (+ fi 2))(= cf (+ ci 1))))
  ((and (= ff (- fi 2))(= cf (- ci 1))))
  ((and (= ff (- fi 2))(= cf (+ ci 1))))
  ((and (= ff (+ fi 1))(= cf (- ci 2))))
  ((and (= ff (- fi 1))(= cf (- ci 2))))
  ((and (= ff (+ fi 1))(= cf (+ ci 2))))
  ((and (= ff (- fi 1))(= cf (+ ci 2))))
  (else #f))
               (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
               (begin
                 (void))
               ))
             (if (equal? "DB" (substring cadena destino  (+ destino 2)))
                 (begin
                   (if (cond
        ((and (= ci cf) (> fi ff)))
        ((and (= ci cf) (< fi ff)))
        ((and (> ci cf) (= fi ff)))
        ((and (< ci cf) (= fi ff)))
        ((and (= (abs (- fi ff))(abs (- ci cf)))))
        (else #f))
      (obstruccion2 fi ci ff cf)
      (begin
        (void)
        )))
                 (if (equal? "RB" (substring cadena destino (+ destino 2)))
                     (begin
                       (if (cond
        ((and (= ff (- fi 1)) (= cf (+ ci 1))))
        ((and (= ff (+ fi 1)) (= cf (- ci 1))))
        ((and (= ff (- fi 1)) (= cf (- ci 1))))
        ((and (= ff (+ fi 1)) (= cf (+ ci 1))))
        ((and (= ff fi) (= cf (+ ci 1))))
        ((and (= ff fi) (= cf (- ci 1))))
        ((and (= cf ci) (= ff (+ fi 1))))
        ((and (= cf ci) (= ff (- fi 1))))
        (else #f))
      (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
      (begin
        (void)
        )))
                     (if (equal? "P" (substring cadena destino (+ destino 1)))
                         (begin
             (if
                (cond
              
              ((or (and (= cf (+ ci 1)) (= ff (+ fi 1)))))
              ((or (and (= cf (- ci 1)) (= ff (+ fi 1)))))
              (else #f))
        (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
        (begin
          (void))))
                         (void))))))
                   )
               )
             (jaqueb destino (+ e 2) f)))
       (void))
  )

(define (obstruccion2 fi ci ff cf)
  (if (and (= ci cf) (> fi ff))
      (begin
      (set! fi (- fi 1))
(paso1jaque fi ci ff cf))
      (begin
        (if (and (= ci cf) (< fi ff))
            (begin
              (set! fi (+ fi 1))
(paso2jaque fi ci ff cf))
            (begin
              (if (and (> ci cf ) (= fi ff))
                  (begin
                    (set! ci (- ci 1))
(paso3jaque fi ci ff cf))
                  (begin
                    (if (and (< ci cf) (= fi ff))
                        (begin
                          (set! ci (+ ci 1))
(paso4jaque fi ci ff cf))
                        (begin
                          (if (and (< ci cf) (< fi ff))
                              (begin
                                (set! ci (+ ci 1))
                                (set! fi (+ fi 1))
(paso5jaque fi ci ff cf))
                             
                              (begin
                                (if (and (> ci cf) (> fi ff))
                                    (begin
                                      (set! ci (- ci 1))
                                      (set! fi (- fi 1))
(paso6jaque fi ci ff cf))
                                    (begin
                                      (if (and (> ci cf) (< fi ff))
                                          (begin
                                            (set! ci (- ci 1))
                                            (set! fi (+ fi 1))
(paso7jaque fi ci ff cf))
                                          (begin
                                            (if (and (< ci cf) (> fi ff))
                                                (begin
                                                  (set! ci (+ ci 1))
                                                  (set! fi (- fi 1))
(paso8jaque fi ci ff cf))
                                                (void)))))))))))))))
      )
  )

(define (paso1jaque fi ci ff cf)
  (if (= fi ff)
      (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
      (begin
        (set! p (-(+ (* (- fi 1) 16) (* 2 cf))1))
         (if(equal? "  " (substring cadena p (+ 2 p)))
            (begin
             (paso1jaque (- fi 1) ci ff cf))
                        (begin
                          (void)
                          )
             ))))

(define (paso2jaque fi ci ff cf)
  (if (= fi ff)
      (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
      (begin
       (set! p (-(+ (* (- fi 1) 16) (* 2 cf))1))
       (if (equal? "  " (substring cadena p (+ 2 p)))
           (begin
             (paso2jaque (+ fi 1) ci ff cf))
           (begin
             (void))))))

(define (paso3jaque fi ci ff cf)
  (if (= ci cf)
      (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
      (begin
        (set! p (-(+ (* (- ff 1) 16) (* 2 ci))1))
         (if(equal? "  " (substring cadena p (+ 2 p)))
            (begin
             (paso3jaque fi (- ci 1) ff cf))
                        (begin
                          (void))
             ))))

(define(paso4jaque fi ci ff cf)
  (if (= ci cf)
      (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
      (begin
       (set! p (-(+ (* (- fi 1) 16) (* 2 ci))1))
       (if (equal? "  " (substring cadena p (+ 2 p)))
           (begin
             (paso4jaque fi (+ ci 1) ff cf))
           (begin
            (void))))))

(define (paso5jaque fi ci ff cf)
  (if (and (= ci cf) (= fi ff))
      (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
      (begin
        (set! p (-(+ (* (- fi 1) 16) (* 2 ci))1))
       (if (equal? "  " (substring cadena p (+ 2 p)))
           (begin
             (paso5jaque (+ fi 1) (+ ci 1) ff cf))
           (begin
             (void))))))

(define (paso6jaque fi ci ff cf)
  (if (and (= ci cf) (= fi ff))
      (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
      (begin
        (set! p (-(+ (* (- fi 1) 16) (* 2 ci))1))
        (if (equal? "  " (substring cadena p (+ 2 p)))
           (begin
             (paso6jaque (- fi 1) (- ci 1) ff cf))
           (begin
             (void))))))

(define (paso7jaque fi ci ff cf)
  (if (and (= ci cf) (= fi ff))
      (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
      (begin
       (set! p (-(+ (* (- fi 1) 16) (* 2 ci))1))
      (if (equal? "  " (substring cadena p (+ 2 p)))
           (begin
             (paso7jaque (+ fi 1) (- ci 1) ff cf))
           (begin
             (void))))))

(define (paso8jaque fi ci ff cf)
  (if (and (= ci cf) (= fi ff))
      (begin
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "black")
        (sleep 3)
        ((draw-string abrazo) (make-posn 250 530) "JAQUE EL REY ESTA AMENAZADO" "brown")
      )
      (begin
       (set! p (-(+ (* (- fi 1) 16) (* 2 ci))1))
       (if (equal? "  " (substring cadena p (+ 2 p)))
           (begin
             (paso8jaque (- fi 1) (+ ci 1) ff cf))
           (begin
             (void))))))

(ajedrez)