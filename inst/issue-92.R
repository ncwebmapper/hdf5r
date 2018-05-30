# create hdf5 file (6 vectors with 10k random numbers each)

h5file <- hdf5r::H5File$new("testdata.h5", "w")
for (i in paste0("vector", 1:6)) {
  h5file[[i]] <- runif(10000)
}
h5file$close_all()

# compare read speed when using h5 and hdf5r package

Rprof("issue-92-h5.out", line.profiling=TRUE)
h5file <- h5::h5file("testdata.h5", "r")
sets <- h5::list.datasets(h5file)
result <- lapply(sets, function(i) h5file[i][])
h5::h5close(h5file)
Rprof(NULL)
  
Rprof("issue-92-hdf5r.out", line.profiling=TRUE)
h5file <- hdf5r::H5File$new("testdata.h5", "r")
sets <- h5file$ls()$name
result <- lapply(sets, function(i) h5file[[i]][])
h5file$close_all()
Rprof(NULL)

summaryRprof("issue-92-hdf5r.out", lines = "show")

summaryRprof("issue-92-h5.out", lines = "show")

