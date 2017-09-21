## create reference for datasets is implemented separately to allow for better ease of use in creating
## H5R_DATASET_REGION references
#' @section Methods:
#' \describe{
#'   \item{\code{create_reference(name = ".", space = NULL)}}{This function implements the HDF5-API function H5Rcreate. If \code{space=NULL} then a \code{H5R_OBJECT} reference is created, otherwise a \code{H5R_DATASET_REGION} reference. Please see the documentation at \url{https://www.hdfgroup.org/HDF5/doc/RM/RM_H5R.html#Reference-Create} for details.}
#' }
