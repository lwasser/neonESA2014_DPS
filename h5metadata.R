#' fxn to read attributes
#' @param fileN The path to the HDF5 file to get attributes from
#' @param group The group or number data set to get attributes from
#' @param natt The numumber of attributes in the given dataset
#' @details Attributes are accessed by an index, therefore we need to no the number of attributes.
#' @return a list where the names are attribute names and the values are the attribute values

h5metadata <- function(fileN, group, natt){
  out <- H5Fopen(fileN)
  g <- H5Gopen(out,group)
  output <- list()
  for(i in 0:(natt-1)){
    ## Open the attribute
    a <- H5Aopen_by_idx(g,i)
    output[H5Aget_name(a)] <-  H5Aread(a)
    ## Close the attributes
    H5Aclose(a)
  }
  H5Gclose(g)
  H5Fclose(out)
  return(output)
}