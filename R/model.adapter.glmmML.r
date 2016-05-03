#-------------------------------------------------------------------------------
#'	model.adapter class for glmmML
#'
#'	This reference class contains methods for \code{\link[glmmML]{glmmML}} in 
#'	\emph{glmmML} package.
#'	Following methods are overriden.
#-------------------------------------------------------------------------------
#	glmmML関数用のmodel.adapterオブジェクトのジェネレーター。
#-------------------------------------------------------------------------------
model.adapter.glmmML <- setRefClass(
	"model.adapter.glmmML", contains = "model.adapter"
)


#-------------------------------------------------------------------------------
#	モデルのfamilyを取得する。
#-------------------------------------------------------------------------------
model.adapter.glmmML$methods(
	get.family = function() {
		"Get family. If family was not specified, return NULL."
		if (!is.null(src$call)) {
			return(src$call$family)
		} else {
			return(src$object$call$family)
		}
	}
)


