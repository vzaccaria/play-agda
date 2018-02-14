
module attempt0 where

open import Data.Vec
open import Data.Nat
open import Coinduction
open import Data.Fin as F hiding(_+_)
open import Relation.Binary.PropositionalEquality
open import Level as L
open import Data.Bool
open import Data.Unit

-- Code labels have type { regs } -> {};
-- Code ends always with a jump or branch

-- Inspiration from https://github.com/sanjoy/Snippets/blob/master/TAL0.agda
-- See also here: http://www.cs.cmu.edu/~concert/talks/Walker2001TAL/slides.ps

data Ctx : Set where
  C : Ctx

ble : Ctx → Ctx
ble C = C
