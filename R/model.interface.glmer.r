#------------------------------------------------------------------------------
#'	(Internal) model.interface class for glmer
#'
#'	This reference class contains methods for \code{\link[lme4]{glmer}} in
#'	\emph{lme4} package.
#'
#'	@include model.interface.default.r
#'	@name model.interface.glmerMod-class (lme4)
#------------------------------------------------------------------------------
model.interface.glmerMod.class <- R6::R6Class(
	"model.interface.glmerMod", inherit = model.interface.default.class
)


#------------------------------------------------------------------------------
#'	@method model.interface glmerMod
#'	@export
#'	@describeIn model.interface S3 method for class 'glmerMod'
#------------------------------------------------------------------------------
model.interface.glmerMod <- model.interface.glmerMod.class$new


#------------------------------------------------------------------------------
model.interface.glmerMod.class$set(
	"public", "get.data",
	function(x, envir, package = "", ...) {
		if (is.call(x)){
			return(super$get.data(x, envir, package, ...))
		} else {
			d <- x@frame
			attr(d, "terms") <- NULL
			# Restore name of offset variable.
			if ("(offset)" %in% colnames(d)) {
				offset.name <- as.character(attr(x@frame, "offset"))
				colnames(d)[colnames(d) == "(offset)"] <- offset.name
			}
			return(strip.offset.in.colnames(d))
		}
	}
)


#------------------------------------------------------------------------------
model.interface.glmerMod.class$set(
	"active", "predict.types",
	function() {
		return(make.predict.types(prob = "response", class = "response"))
	}
)


#------------------------------------------------------------------------------
model.interface.glmerMod.class$set(
	"public", "adjust.offset",
	function(x, envir, package, pred, ...) {
		return(pred)
	}
)
