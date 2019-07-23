#' demonstrate 3d t-SNE reduction
#' @note This is a result of Rtsne with dims=3 and no other tuning, applied to the 739 x 3584 Darmanis 2017 subset
#' @export
spin_tsne = function() {
 requireNamespace("threejs")
 threejs::scatterplot3js(t1.3d$Y, col=accpal[factor(cell_type_3.5k)], size=.4, 
   labels=as.character(cell_type_3.5k))
}
