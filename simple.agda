
module simple where


data Bool : Set where
  True : Bool
  False : Bool

x : Bool
x = True

y : Bool → Bool
y True = True
y False = False
