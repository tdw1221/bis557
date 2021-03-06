#' Fit a linear model
#'
#' @description This function passes parameters to the lm function.
#' @param formula a formula
#' @param data a data.frame
#' @return An lm object
#' @importFrom stats lm
#' @examples
#' fit <- linear_model(Sepal.Length ~., iris)
#' summary(fit)
#' @export
linear_model <- function(formula, data) {
  X = model.matrix(formula, data)
  Y= model.frame(formula,data)[,1]
  beta <- qr.solve(X,Y)
  for (i in 1:length(beta)){
    if (beta[i] == 0)
      beta[i] = NA
    
  }
  ret <- list()
  ret$coefficients = c(beta)
  ret$call = paste("lm(formula = ", format(formula), ",data = ", deparse(substitute(data)),")", sep = "")
  class(ret) = "lm"
  return(ret)
}




