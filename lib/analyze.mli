module OLS : sig
  type t

  val ols :
       responder:Label.t
    -> predictors:Label.t array
    -> Measurement_raw.t array
    -> t

  module Map : Map.S with type key = string

  val pp : ?colors:Fmt.style Map.t -> t Fmt.t
end

module RANSAC : sig
  type t

  val ransac : ?filter_outliers:bool -> Label.t -> Measurement_raw.t array -> t
  val pp : t Fmt.t
end

type 'a t

val ols : predictors:Label.t array -> OLS.t t
val ransac : filter_outliers:bool -> RANSAC.t t
val analyze : 'a t -> Label.t -> Measurement_raw.t array -> 'a
