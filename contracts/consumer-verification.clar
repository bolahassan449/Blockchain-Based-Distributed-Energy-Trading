;; Consumer Verification Contract
;; This contract validates energy users in the system

(define-data-var admin principal tx-sender)

;; Map to store verified consumers
(define-map verified-consumers principal
  {
    name: (string-utf8 100),
    max-consumption: uint,
    location: (string-utf8 100),
    verified: bool
  }
)

;; Public function to register a new consumer
(define-public (register-consumer (name (string-utf8 100)) (max-consumption uint) (location (string-utf8 100)))
  (let ((consumer tx-sender))
    (if (is-consumer consumer)
      (err u1) ;; Already registered
      (ok (map-set verified-consumers consumer
        {
          name: name,
          max-consumption: max-consumption,
          location: location,
          verified: false
        }
      ))
    )
  )
)

;; Admin function to verify a consumer
(define-public (verify-consumer (consumer principal))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u403)) ;; Only admin can verify
    (asserts! (is-consumer consumer) (err u404)) ;; Consumer must exist

    (let ((consumer-data (unwrap! (map-get? verified-consumers consumer) (err u404))))
      (ok (map-set verified-consumers consumer
        (merge consumer-data { verified: true })
      ))
    )
  )
)

;; Read-only function to check if an address is a registered consumer
(define-read-only (is-consumer (address principal))
  (is-some (map-get? verified-consumers address))
)

;; Read-only function to check if a consumer is verified
(define-read-only (is-verified-consumer (address principal))
  (match (map-get? verified-consumers address)
    consumer-data (get verified consumer-data)
    false
  )
)

;; Read-only function to get consumer details
(define-read-only (get-consumer-details (address principal))
  (map-get? verified-consumers address)
)

;; Function to transfer admin rights
(define-public (transfer-admin (new-admin principal))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u403))
    (ok (var-set admin new-admin))
  )
)
