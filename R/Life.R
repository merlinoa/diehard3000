#' check_Life
#' 
#' @param object object of class \code{Life}
#' 
#' function to check validity of Insuree S4 class constructor
check_Life <- function(object) {
  errors <- character()
  if (!identical(length(object@x_), 
                length(object@t_),
                length(object@m_),
                1L)) { 
    errors <- c(errors, "Error! x_, t_, and m_ must all be of length 1")
  }
  
  # validate x_
  if (object@x_ < min(object@life_table@x) || object@x_ >= (max(object@life_table@x) + 1)) {
    errors <- c(errors, "Error! x_ must be in range of x on ActuarialTable")
  }
  
  # validate t_
  if (object@t_ <= 0) {
    errors <- c(errors, "Error! t_ must be >= 0")
  }
  if (object@x_ + object@t_ > (max(object@life_table@x) + 1L)) {
    errors <- c(errors, "Error! x_ + t_ > (max(x) + 1)")
  }
  
  # validate m_
  if (object@m_ < 0) {
    errors <- c(errors, "Error! m_ must be >= 0")
  }
  if (object@x_ + object@t_ + object@m_ > (max(object@life_table@x) + 1L)) {
    errors <- c(errors, "Error! x_ + t_ + m_ > (max(x) + 1)")
  }

  if (identical(length(errors), 0)) {
    TRUE
  } else {
    errors
  }
}


#' Life
#' 
#' An individual with some kind of life contingent insurance
#' 
#' #@include LifeTable.R
#' #@include Interest.R
#' #@include Benefit.R
#' @slot x_ x value for individual
#' @slot t_ t value for individual
#' @slot m_ m value for individual
#' @slot lifetable onject of class \code{LifeTable}
#' @slot benefit a list of objects of class \code{Benefit}
#' 
#' @name Life-class
#' @rdname Life-class
#' @export Life
#' 
#' @examples 
#' Life()
Life <- setClass("Life",
                 #contains = c("LifeTable", "Interest", "Benefit"),
                 slots = list(x_ = "numeric",
                              t_ = "numeric",
                              m_ = "numeric",
                              life_table = "LifeTable",
                              benefit = "list"
                              ),
                 prototype = prototype(x_ = 2,
                                       t_ = 3,
                                       m_ = 0,
                                       life_table = LifeTable(),
                                       benefit = list(NULL)
                                       ),
                 validity = check_Life
)
