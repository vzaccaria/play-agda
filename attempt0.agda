
module attempt0 where

open import Data.Nat

size : ℕ
size = 2

Reg = F.Fin size

mutual
  Γ′ : ℕ → Set
  Γ′ n = Vec Type n

  Γ = Γ′ size

data Type : Set where
  natType : Type
  blockType : Γ′ size → Type
  anything : Type
