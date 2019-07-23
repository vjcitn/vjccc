#' smooth_exprs will compute an 'RNA-seq based CNV profile" as
#' in Darmanis et al. Cell 2017
#' @importFrom RcppRoll roll_mean
#' @param rse a RangedSummarizedExperiment instance
#' @param seqname character(1)
#' @param id sample identifier or index to process
#' @param bandwidth a fraction defaulting to 0.1 that will
#' determine window width
#' @param tx a function defaulting to function(x)log(x+1)
#' @return a data.frame with x=smoothed position and y=smoothed tx(expression)
#' @export
smooth_exprs = function(rse, seqname="1", id=1, bandwidth=.1,
     tx=function(x)log(x+1)) {
  stopifnot(is(rse, "RangedSummarizedExperiment"))
  kept = rse[which(as.character(seqnames(rse))==as.character(seqname)),]
  x = IRanges::start(rowRanges(kept))
  y = tx(assay(kept[,id]))[order(x)]
  wid = length(x)*bandwidth
  y = roll_mean(y, wid)
  x = roll_mean(sort(x), wid)
  data.frame(x=x,y=y)
}
  
