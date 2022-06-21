-- File auto generated by purescript-bridge! --
module Ledger.Constraints.OffChain where

import Prelude

import Control.Lazy (defer)
import Data.Argonaut (encodeJson, jsonNull)
import Data.Argonaut.Decode (class DecodeJson)
import Data.Argonaut.Decode.Aeson ((</$\>), (</*\>), (</\>))
import Data.Argonaut.Encode (class EncodeJson)
import Data.Argonaut.Encode.Aeson ((>$<), (>/\<))
import Data.Generic.Rep (class Generic)
import Data.Lens (Iso', Lens', Prism', iso, prism')
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Lens.Record (prop)
import Data.Map (Map)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, unwrap)
import Data.Set (Set)
import Data.Show.Generic (genericShow)
import Data.Tuple.Nested ((/\))
import Ledger.Address (PaymentPubKeyHash)
import Ledger.Tx.Internal (Tx)
import Ledger.Typed.Tx (ConnectionError)
import Plutus.V1.Ledger.Interval (Interval)
import Plutus.V1.Ledger.Scripts (DatumHash)
import Plutus.V1.Ledger.Time (POSIXTime)
import Plutus.V1.Ledger.Tx (TxOut, TxOutRef)
import Type.Proxy (Proxy(Proxy))
import Data.Argonaut.Decode.Aeson as D
import Data.Argonaut.Encode.Aeson as E
import Data.Map as Map

data MkTxError
  = TypeCheckFailed ConnectionError
  | TxOutRefNotFound TxOutRef
  | TxOutRefWrongType TxOutRef
  | DatumNotFound DatumHash
  | MintingPolicyNotFound String
  | ValidatorHashNotFound String
  | OwnPubKeyMissing
  | TypedValidatorMissing
  | DatumWrongHash DatumHash String
  | CannotSatisfyAny
  | NoMatchingOutputFound String
  | MultipleMatchingOutputsFound String

derive instance Eq MkTxError

instance Show MkTxError where
  show a = genericShow a

instance EncodeJson MkTxError where
  encodeJson = defer \_ -> case _ of
    TypeCheckFailed a -> E.encodeTagged "TypeCheckFailed" a E.value
    TxOutRefNotFound a -> E.encodeTagged "TxOutRefNotFound" a E.value
    TxOutRefWrongType a -> E.encodeTagged "TxOutRefWrongType" a E.value
    DatumNotFound a -> E.encodeTagged "DatumNotFound" a E.value
    MintingPolicyNotFound a -> E.encodeTagged "MintingPolicyNotFound" a E.value
    ValidatorHashNotFound a -> E.encodeTagged "ValidatorHashNotFound" a E.value
    OwnPubKeyMissing -> encodeJson { tag: "OwnPubKeyMissing", contents: jsonNull }
    TypedValidatorMissing -> encodeJson { tag: "TypedValidatorMissing", contents: jsonNull }
    DatumWrongHash a b -> E.encodeTagged "DatumWrongHash" (a /\ b) (E.tuple (E.value >/\< E.value))
    CannotSatisfyAny -> encodeJson { tag: "CannotSatisfyAny", contents: jsonNull }
    NoMatchingOutputFound a -> E.encodeTagged "NoMatchingOutputFound" a E.value
    MultipleMatchingOutputsFound a -> E.encodeTagged "MultipleMatchingOutputsFound" a E.value

instance DecodeJson MkTxError where
  decodeJson = defer \_ -> D.decode
    $ D.sumType "MkTxError"
    $ Map.fromFoldable
        [ "TypeCheckFailed" /\ D.content (TypeCheckFailed <$> D.value)
        , "TxOutRefNotFound" /\ D.content (TxOutRefNotFound <$> D.value)
        , "TxOutRefWrongType" /\ D.content (TxOutRefWrongType <$> D.value)
        , "DatumNotFound" /\ D.content (DatumNotFound <$> D.value)
        , "MintingPolicyNotFound" /\ D.content (MintingPolicyNotFound <$> D.value)
        , "ValidatorHashNotFound" /\ D.content (ValidatorHashNotFound <$> D.value)
        , "OwnPubKeyMissing" /\ pure OwnPubKeyMissing
        , "TypedValidatorMissing" /\ pure TypedValidatorMissing
        , "DatumWrongHash" /\ D.content (D.tuple $ DatumWrongHash </$\> D.value </*\> D.value)
        , "CannotSatisfyAny" /\ pure CannotSatisfyAny
        , "NoMatchingOutputFound" /\ D.content (NoMatchingOutputFound <$> D.value)
        , "MultipleMatchingOutputsFound" /\ D.content (MultipleMatchingOutputsFound <$> D.value)
        ]

derive instance Generic MkTxError _

--------------------------------------------------------------------------------

_TypeCheckFailed :: Prism' MkTxError ConnectionError
_TypeCheckFailed = prism' TypeCheckFailed case _ of
  (TypeCheckFailed a) -> Just a
  _ -> Nothing

_TxOutRefNotFound :: Prism' MkTxError TxOutRef
_TxOutRefNotFound = prism' TxOutRefNotFound case _ of
  (TxOutRefNotFound a) -> Just a
  _ -> Nothing

_TxOutRefWrongType :: Prism' MkTxError TxOutRef
_TxOutRefWrongType = prism' TxOutRefWrongType case _ of
  (TxOutRefWrongType a) -> Just a
  _ -> Nothing

_DatumNotFound :: Prism' MkTxError DatumHash
_DatumNotFound = prism' DatumNotFound case _ of
  (DatumNotFound a) -> Just a
  _ -> Nothing

_MintingPolicyNotFound :: Prism' MkTxError String
_MintingPolicyNotFound = prism' MintingPolicyNotFound case _ of
  (MintingPolicyNotFound a) -> Just a
  _ -> Nothing

_ValidatorHashNotFound :: Prism' MkTxError String
_ValidatorHashNotFound = prism' ValidatorHashNotFound case _ of
  (ValidatorHashNotFound a) -> Just a
  _ -> Nothing

_OwnPubKeyMissing :: Prism' MkTxError Unit
_OwnPubKeyMissing = prism' (const OwnPubKeyMissing) case _ of
  OwnPubKeyMissing -> Just unit
  _ -> Nothing

_TypedValidatorMissing :: Prism' MkTxError Unit
_TypedValidatorMissing = prism' (const TypedValidatorMissing) case _ of
  TypedValidatorMissing -> Just unit
  _ -> Nothing

_DatumWrongHash :: Prism' MkTxError { a :: DatumHash, b :: String }
_DatumWrongHash = prism' (\{ a, b } -> (DatumWrongHash a b)) case _ of
  (DatumWrongHash a b) -> Just { a, b }
  _ -> Nothing

_CannotSatisfyAny :: Prism' MkTxError Unit
_CannotSatisfyAny = prism' (const CannotSatisfyAny) case _ of
  CannotSatisfyAny -> Just unit
  _ -> Nothing

_NoMatchingOutputFound :: Prism' MkTxError String
_NoMatchingOutputFound = prism' NoMatchingOutputFound case _ of
  (NoMatchingOutputFound a) -> Just a
  _ -> Nothing

_MultipleMatchingOutputsFound :: Prism' MkTxError String
_MultipleMatchingOutputsFound = prism' MultipleMatchingOutputsFound case _ of
  (MultipleMatchingOutputsFound a) -> Just a
  _ -> Nothing

--------------------------------------------------------------------------------

newtype UnbalancedTx = UnbalancedTx
  { unBalancedTxTx :: Tx
  , unBalancedTxRequiredSignatories :: Set PaymentPubKeyHash
  , unBalancedTxUtxoIndex :: Map TxOutRef TxOut
  , unBalancedTxValidityTimeRange :: Interval POSIXTime
  }

derive instance Eq UnbalancedTx

instance Show UnbalancedTx where
  show a = genericShow a

instance EncodeJson UnbalancedTx where
  encodeJson = defer \_ -> E.encode $ unwrap >$<
    ( E.record
        { unBalancedTxTx: E.value :: _ Tx
        , unBalancedTxRequiredSignatories: E.value :: _ (Set PaymentPubKeyHash)
        , unBalancedTxUtxoIndex: (E.dictionary E.value E.value) :: _ (Map TxOutRef TxOut)
        , unBalancedTxValidityTimeRange: E.value :: _ (Interval POSIXTime)
        }
    )

instance DecodeJson UnbalancedTx where
  decodeJson = defer \_ -> D.decode $
    ( UnbalancedTx <$> D.record "UnbalancedTx"
        { unBalancedTxTx: D.value :: _ Tx
        , unBalancedTxRequiredSignatories: D.value :: _ (Set PaymentPubKeyHash)
        , unBalancedTxUtxoIndex: (D.dictionary D.value D.value) :: _ (Map TxOutRef TxOut)
        , unBalancedTxValidityTimeRange: D.value :: _ (Interval POSIXTime)
        }
    )

derive instance Generic UnbalancedTx _

derive instance Newtype UnbalancedTx _

--------------------------------------------------------------------------------

_UnbalancedTx :: Iso' UnbalancedTx { unBalancedTxTx :: Tx, unBalancedTxRequiredSignatories :: Set PaymentPubKeyHash, unBalancedTxUtxoIndex :: Map TxOutRef TxOut, unBalancedTxValidityTimeRange :: Interval POSIXTime }
_UnbalancedTx = _Newtype