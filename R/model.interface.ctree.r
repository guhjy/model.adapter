#------------------------------------------------------------------------------
#	ctree関数用のmodel.interfaceオブジェクトのジェネレーター。
#	以下のメソッドをオーバーライドした。
#------------------------------------------------------------------------------
#'	model.interface class for ctree
#'
#'	This reference class contains methods for \code{\link[party]{ctree}} in
#'	\emph{party} package.
#'	Note that because an object of BinaryTree does not keep original call,
#'	get.call() function always returns NULL. Also, when an instance of this
#'	class is made from model object, 'call' field is always call("<undef>").
#'
#'	Following methods are overriden.
#
#'	@include model.interface.default.r
#'	@family model.interface
#'	@export model.interface.BinaryTree
#'	@exportClass model.interface.BinaryTree
#------------------------------------------------------------------------------
model.interface.BinaryTree <- setRefClass(
	"model.interface.BinaryTree", contains = "model.interface"
)


#------------------------------------------------------------------------------
#	モデルオブジェクトからcallを取得する。
#------------------------------------------------------------------------------
model.interface.BinaryTree$methods(
	get.call = function(x) {
		return(NULL)
	}
)


#------------------------------------------------------------------------------
#	formulaを取り出し。
#------------------------------------------------------------------------------
model.interface.BinaryTree$methods(
	get.formula = function(x, envir = parent.frame()) {
		if (is.call(x)) {
			x <- match.call(cforest, x)
			return(eval(x$formula, envir))
		} else {
			# Shared method with cforest / cforestと同じ手法。
			adapter <- model.interface.RandomForest(x)
			return(adapter$get.formula(x, envir))
		}
	}
)


#------------------------------------------------------------------------------
#	モデル作成に使われたデータを返す。
#------------------------------------------------------------------------------
model.interface.BinaryTree$methods(
	get.data = function(x, envir = parent.frame()) {
		if (is.call(x)) {
		   	return(callSuper(x, envir))
		} else {
			# Shared method with cforest / cforestと同じ手法。
			adapter <- model.interface.RandomForest(x)
			return(adapter$get.data(x, envir))
		}
	}
)


#------------------------------------------------------------------------------
#	predictのtypeを関数に合わせて変換する変換表を取得する。
#------------------------------------------------------------------------------
model.interface.BinaryTree$methods(
	predict.types = function() {
		return(make.predict.types(link = "response", class = "response"))
	}
)
