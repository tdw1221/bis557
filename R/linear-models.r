
#' Fit a linear model
#'
#' @description This function passes parameters to the lm function.
#' @param formula a formula
#' @param data a data.frame
#' @return An lm object
#' @examples
#' fit <- linear_model(Sepal.Length ~., iris)
#' summary(fit)
#' @export
linear_model <- function(formula, data) {
  # Your code here.
  return(lm(formula = formula, data = data))
}


#' A data set for the first homework
#'
#' @name lm_patho
#' @docType data
#' @rdname lm_patho
#' @description In homework 1 we explore the effect of numerical instability
#' on linear regressions. This data set gives us a basis for exploration.
NULL
