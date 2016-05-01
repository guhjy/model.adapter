# Test for glmmML
test__all(
	call = substitute(
		glmmML(
			as.integer(Sepal.Length) ~ ., data = iris, family = poisson,
			cluster = Species
		)
	),
	function.name = "glmmML",
	family = "poisson"
)


