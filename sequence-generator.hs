rr seed coeffs =
  let x = seed ++ foldl (zipWith (+)) (repeat 0) (zipWith (\c -> map (*c)) coeffs (iterate tail x))
  in x

-- $> take 20 $ rr [0,1] [1,1] -- fibonacci

-- $> take 20 $ rr [2,1] [1,1] -- lucas sequence

-- $> take 20 $ rr [0,1] [-2,3] -- mersenne numbers

-- $> take 20 $ rr [0,0,1] [-1,-1,3] -- A048739
