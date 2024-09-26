#' Class definition for statbanktools series-object
#'
#' @slot mnemonic character.
#' @slot description character.
#' @slot units character.
#' @slot source character.
#' @slot table character.
#' @slot index ANY.
#' @slot model_desc character.
#' @slot frequency numeric.
#' @slot start_date numeric.
#' @slot end_date numeric.
#' @slot raw_data ts.
#' @slot data mts.
#'
#' @return A series-object
#' @export
#'
#' @examples
#' series_obj <- new("series-obj")
setClass("series-obj",
         slots = list(mnemonic     = "character",
                      description  = "character",
                      units        = "character",
                      source       = "character",
                      table        = "character",
                      index        = "ANY",
                      model_desc   = "character",
                      frequency    = "numeric",
                      start_date   = "numeric",
                      end_date     = "numeric",
                      raw_data     = "ts",
                      #growth_rates = "mts",
                      #differences  = "mts",
                      data         = "mts"))
