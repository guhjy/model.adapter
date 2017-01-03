#-------------------------------------------------------------------------------
#	cforest関数用のmodel.interfaceオブジェクトのジェネレーター。
#	以下のメソッドをオーバーライドした。
#-------------------------------------------------------------------------------
#'	model.interface class for cforest
#'
#'	This reference class contains methods for \code{\link[party]{cforest}} in
#'	\emph{party} package.
#'	Note that because an object of RandomForest does not keep original call,
#'	get.call() function always returns NULL. Also, when an instance of this
#'	class is made from model object, 'call' field is always call("<undef>").
#'
#'	Following methods are overriden.
#
#'	@include model.interface.default.r
#'	@family model.interface
#'	@export model.interface.RandomForest
#'	@exportClass model.interface.RandomForest
#-------------------------------------------------------------------------------
model.interface.RandomForest <- setRefClass(
	"model.interface.RandomForest", contains = "model.interface"
)


#-------------------------------------------------------------------------------
#	モデルオブジェクトからcallを取得する。
#-------------------------------------------------------------------------------
model.interface.RandomForest$methods(
	get.call = function(x) {
		return(NULL)
	}
)

#-------------------------------------------------------------------------------
#	formulaを取り出し。
#-------------------------------------------------------------------------------
model.interface.RandomForest$methods(
	get.formula = function(x, envir = parent.frame()) {
		if (is.object(x)) {
			# custom 
			y <- as.character(x@data@formula$response[2])
			x <- as.character(x@data@formula$input[2])
			f <- as.formula(paste(y, x, sep = "~"))
			return(f)
		} else {
			x <- match.call(cforest, x)
			return(eval(x$formula, envir))
		}
	}
)


#-------------------------------------------------------------------------------
#	モデル作成に使われたデータを返す。
#-------------------------------------------------------------------------------
model.interface.RandomForest$methods(
	get.data = function(x, envir = parent.frame()) {
		if (is.call(x)){
			return(callSuper(x, envir))
		} else {
			input <- x@data@get("input")
			response <- x@data@get("response")
			d <- cbind(input, response)
		}
	}
)


