#-------------------------------------------------------------------------------
#	テスト用に全てのスクリプトを読み込む。
#	Read all scripts for developmental purpose.
#-------------------------------------------------------------------------------
#	function		class			package
#	-----------------------------------------------
#	lm				lm				stats
#	glm				glm, lm			stats
#	lme				lme				nlme
#	glmmML			glmmML			glmmML
#	lmer			lmerMod			lme4
#	glmer			glmerMod		lme4
#	ctree			BinaryTree		party
#	cforest			RandomForest	party
#	randomForest	randomForest	randomForest
#	gbm				gbm				gbm
#	svm				svm.formula		e1071
#	tree			tree			tree
#	rpart			rpart			rpart
#	gam				gam				mgcv, gam
#	gamm			gamm			mgcv
#	ranger			ranger			ranger
#	MCMCglmm		MCMCglmm		MCMCglmm
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
#	List of type of predict methods.
#-------------------------------------------------------------------------------
#	function		response	link		prob	class		remarks
#	----------------------------------------------------------------------------
#	cforest			response	----		prob	response	�ｿｽ�ｿｽ�ｿｽ�ｿｽ�ｿｽﾏ撰ｿｽ�ｿｽ^�ｿｽﾅ費ｿｽ�ｿｽ�ｿｽ
#	ctree			response	----		prob	response	�ｿｽ�ｿｽ�ｿｽ�ｿｽ�ｿｽﾏ撰ｿｽ�ｿｽ^�ｿｽﾅ費ｿｽ�ｿｽ�ｿｽ
#	gam				response	link		----	----
#	gamm			response	link		----	----
#	gbm				response	link		----	----
#	glm				response	link		----	----
#	glmer			response	link		----	----
#	glmmadmb		response	link		----	----
#	glmmML			response	link		----	----
#	lm				response	----		----	----
#	lme				----		----		----	----
#	lmer			response	link		----	----
#	MCMCglmm		response	term		----	----
#	randomForest	response	----		prob	response	�ｿｽ�ｿｽ�ｿｽ�ｿｽ�ｿｽﾏ撰ｿｽ�ｿｽ^�ｿｽﾅ費ｿｽ�ｿｽ�ｿｽ
#	ranger			----		----		----	----		�ｿｽ�ｿｽ�ｿｽﾊにゑｿｽ�ｿｽ�ｿｽ�ｿｽﾈ擾ｿｽ�が難ｿｽ�ｿｽ�ｿｽ�ｿｽﾄゑｿｽB
#	rpart			vector		matrix?		prob	class		matrix�ｿｽ�ｿｽlink�ｿｽ�ｿｽ�ｿｽ�ｿｽ�ｿｽ�ｿｽﾅゑｿｽ�ｿｽ�ｿｽﾌゑｿｽ�ｿｽH
#	svm				----		----		----	----		probability�ｿｽ�ｿｽ�ｿｽ�ｿｽ�ｿｽﾅコ�ｿｽ�ｿｽ�ｿｽg�ｿｽ�ｿｽ�ｿｽ[�ｿｽ�ｿｽ
#	tree			vector		----		vector	class
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
#	スクリプトがあるディレクトリ名を返す関数。
#	http://stackoverflow.com/questions/1815606/rscript-determine-path-of-the-executing-script
#-------------------------------------------------------------------------------
get.this.file.dir <- function() {
	cmdArgs <- commandArgs(trailingOnly = FALSE)
	needle <- "--file="
	match <- grep(needle, cmdArgs)
	if (length(match) > 0) {
		# Rscript
		return(dirname(sub(needle, "", cmdArgs[match])))
	} else {
		# 'source'd via R console
		return(dirname(normalizePath(sys.frames()[[1]]$ofile)))
	}
}

#-------------------------------------------------------------------------------
#	ソース読み込み
#-------------------------------------------------------------------------------
base.path <- file.path(get.this.file.dir(), "R")
source(file.path(base.path, "model.interface.default.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.cforest.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.ctree.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.gam.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.gamm.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.gbm.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.glm.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.glmer.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.glmmML.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.lm.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.lme.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.lmer.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.MCMCglmm.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.randomForest.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.ranger.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.rpart.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.svm.r"), encoding = "UTF-8")
source(file.path(base.path, "model.interface.tree.r"), encoding = "UTF-8")
source(file.path(base.path, "model.adapter.r"), encoding = "UTF-8")

source(file.path(base.path, "utils.r"), encoding = "UTF-8")
source(file.path(base.path, "const.r"), encoding = "UTF-8")
source(file.path(base.path, "find.package.r"), encoding = "UTF-8")
source(file.path(base.path, "get.class.name.r"), encoding = "UTF-8")
source(file.path(base.path, "ma.prediction.r"), encoding = "UTF-8")
source(file.path(base.path, "predict.types.r"), encoding = "UTF-8")

source(file.path(base.path, "tests.r"), encoding = "UTF-8")
