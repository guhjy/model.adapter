# Test for rpart
test__all(
	call = substitute(rpart(Sepal.Length ~ ., data = iris)),
	function.name = "rpart"
)
