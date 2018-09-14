
#' Fit a linear model
#'
#' @description This function passes parameters to the lm function.
#' @param formula a formula
#' @param data a data.frame
#' @import stats
#' @return An lm object
#' @examples
#' @export


  # Your code here.
  linear_model <- function (formula, data) {
    y <- stats::model.frame(formula, data)[,1]
    X <- stats::model.matrix(formula, data)
    
    rvars <- colnames(X)
    omit <- rownames(alias(formula, data)$Complete)
    X <- X[, setdiff(rvars, omit)]

    QR <- qr(X)
    Q <- qr.Q(QR)
    R <- qr.R(QR)

    coeff <- backsolve(R, t(Q) %*% y)[,1]
    names(coeff) <- setdiff(rvars, omit)
    beta_hat <- sapply(rvars, function (x) {coeff[match(x, names(coeff))]})
    names(beta_hat) <- rvars
    beta_hat <- list(coefficients = beta_hat)
    class(beta_hat) <- "lm"

    # beta_hat <- list(call = match.call(), coefficients = beta_hat)
    # beta_hat <- list(call = match.call(), coefficients = coeff)
    # beta_hat
    
    return(beta_hat)
}




