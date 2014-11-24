(ns bob)

(defn response-for [what]
  (letfn [(shout? [in] 
            (and (re-find #"[A-Z]" in)
                 (re-find #"^[^a-z]*$" in)))
        (question? [in]
          (= (last in) \?))
        (silence? [in]
          (re-find #"^[\s]*$" in))]
  (cond 
    (shout? what) "Whoa, chill out!"
    (question? what) "Sure."
    (silence? what) "Fine. Be that way!"
    :else "Whatever.")))
